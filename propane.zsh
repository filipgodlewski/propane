#!/env/zsh

COLOR_NORMAL=$(tput sgr0)
COLOR_CYAN=$(tput setaf 6)

local base_path="$(dirname $0)"
local empty_string="\nProvided an empty string. Cannot proceed. Aborting."

echo -n "Provide project name: "
read project_name
[ -z "${project_name}" ] && echo "${empty_string}" && exit 1

echo -n "Provide author name: "
read author_name
[ -z "${author_name}" ] && echo "${empty_string}" && exit 1

echo -n "Provide author email: "
read author_email
[ -z "${author_email}" ] && echo "${empty_string}" && exit 1

echo -n "Provide user name for local git repository: "
read git_username
[ -z "${git_username}" ] && echo "${empty_string}" && exit 1

echo -n "Provide user email for local git repository: "
read git_email
[ -z "${git_email}" ] && echo "${empty_string}" && exit 1

language_type="python"
license_type="mit"

local project_name=$(echo "${project_name}" | tr " " "_")
local project_location="${PWD}/${project_name}"
local project_src_path="${project_location}/${project_name}"
local project_docs_path="${project_location}/docs"
local project_tests_path="${project_location}/tests"

eval "$(pyenv init -)" || exit 1
eval "$(pyenv virtualenv-init -)" || exit 1
source "resources/pytomata/pytomata.zsh" || exit 1

mkdir "${project_name}"

cp "${base_path}/resources/licenses/${license_type}_license" "${project_location}/LICENSE.txt"
touch "${project_location}/HOW_TO_CONTRIBUTE" "${project_location}/CODE_OF_CONDUCT"
mkdir "${project_src_path}" "${project_docs_path}" "${project_tests_path}"
case "${language_type}" in
    "python")
        touch "${project_src_path}/__init__.py" "${project_src_path}/app.py"
        touch "${project_tests_path}/__init__.py" "${project_tests_path}/test_app.py"
        cp "${base_path}/resources/requirements/${language_type}_requirements.txt" "${project_location}/requirements.txt"
        cp "${base_path}/resources/requirements/${language_type}_test-requirements.txt" "${project_location}/test-requirements.txt"
        touch "${project_location}/README.rst" "${project_location}/examples.py"
        ;;
esac

sed -i "" -e "s/\[year\]/$(date +"%Y")/" "${project_location}/LICENSE.txt"
sed -i "" -e "s/\[fullname\]/${author_name} <${author_email}>/" "${project_location}/LICENSE.txt"
# echo into README.rst

cp "${base_path}/resources/gitignore/Python.gitignore" "${project_location}/.gitignore"
cd "${project_location}"

git init -q
git config --local user.name "${git_username}"
git config --local user.email "${git_email:l}"

case "${language_type}" in
    python) mkenv -y ;;
esac

echo "\nCreated project with the following properties:"
echo "project name: ${COLOR_CYAN}${project_name:l}${COLOR_NORMAL}"
echo "project location: ${COLOR_CYAN}${project_location:l}${COLOR_NORMAL}"
echo "author name: ${COLOR_CYAN}${author_name}${COLOR_NORMAL}"
echo "author email: ${COLOR_CYAN}${author_email:l}${COLOR_NORMAL}"
echo "language type: ${COLOR_CYAN}${language_type:l}${COLOR_NORMAL}"
echo "license type: ${COLOR_CYAN}${license_type:u}${COLOR_NORMAL}"
