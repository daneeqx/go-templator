import logging
import subprocess
from pathlib import Path
from typing import Tuple, Optional
import os

logging.basicConfig(
    level=logging.INFO,
    format="%(levelname)s: %(message)s"
)

def run_command(command: str, cwd: Optional[str] = None) -> Tuple[bool, str]:
    """
    Run a shell command and return (success, output).
    """
    try:
        result = subprocess.run(
            command, shell=True, check=True,
            stdout=subprocess.PIPE, stderr=subprocess.STDOUT, text=True,
            cwd=cwd
        )
        return True, result.stdout
    except subprocess.CalledProcessError as e:
        return False, e.output
    except Exception as e:
        return False, str(e)

def main() -> None:
    """
    Post-generation hook for Go project setup.
    """
    logging.info("Setting up Go project...")
    
    # Get the project directory
    project_dir = Path.cwd()
    logging.info(f"Project directory: {project_dir}")

    # Check if git already exists
    steps = []
    
    if not (project_dir / ".git").exists():
        steps.append(("Initialize git repository", "git init", True))
    else:
        logging.info("✓ Git repository already exists")
    
    # Make scripts executable if they exist
    scripts_dir = project_dir / "scripts"
    if scripts_dir.exists():
        steps.append(("Make scripts/*.sh executable", "chmod +x scripts/*.sh", True))
    else:
        steps.append(("Create scripts directory", "mkdir -p scripts", False))

    # Execute steps
    for description, command, critical in steps:
        success, output = run_command(command, cwd=str(project_dir))
        if success:
            logging.info(f"✓ {description}")
        else:
            if critical:
                logging.error(f"✗ {description} failed:\n{output}")
            else:
                logging.warning(f"⚠ {description} failed (non-critical):\n{output}")

    logging.info("\n🎉 Go project created successfully!")
    logging.info("\nNext steps:")
    logging.info("1. cd into the generated directory")
    logging.info("2. Run: go mod tidy")
    logging.info("3. Build: make build")
    logging.info("4. Run: ./bin/{{cookiecutter.domain}}")

if __name__ == "__main__":
    main()