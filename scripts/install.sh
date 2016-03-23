dotnet --version 2>/dev/null || { echo >&2 "Please install dotnet-cli first."; exit 1; } 
dotnet restore ./src || { echo >&2 "Fail to restore source folder."; exit 1; }

if [ -d ~/.omnisharp/local ]; then
  echo "Removing local omnisharp ..."
  rm -rf ~/.omnisharp/local
fi
mkdir -p ~/.omnisharp/local

for framework in dnx451 dnxcore50; do
  dotnet publish ./src/Omnisharp -o ~/.omnisharp/local/$framework --framework $framework || { echo >&2 "Fail to publish OmniSharp under $framework"; exit 1; }
done
