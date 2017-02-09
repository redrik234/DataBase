// database.cpp: определяет точку входа для консольного приложения.
//

#include "stdafx.h"
#include <iostream>
#include <fstream>
#include <string>
#include <map>
#include <vector>
#include <boost/algorithm/string.hpp>

using namespace std;

typedef map<string, vector<int>> info;

void ReadBD(ifstream &file, info &x)
{
	string str; 
	vector<string> margin;

	while (getline(file, str))
	{
		boost::split(margin, str, boost::is_any_of(","));
		if (*(margin[4].begin()) == '"')
		{
			margin[4].erase(margin[4].begin());
			margin[4].erase(margin[4].end() - 1);
		}
		int id = atoi(margin[0].c_str());
		if (id != 0)
		{
			x[margin[4]].push_back(id);
		}

	}
}

void OutId(info & x)
{
	string user;
	
	cout << "Enter username: ";
	getline(cin, user);

	auto tempMap = x.find(user);
	if (tempMap != x.end())
	{
		cout << "Record id: ";
		for (auto id : tempMap->second)
			cout << id << " ";
		cout << "\n";
	}
	else
		cout << "Username not found\n";

}

int main(int argc, char *argv[])
{
	if (argc != 2)
	{
		cout << "Invalid arguments cout:\n"
			<< "Usage: database.exe <file.csv>\n";
		return 1;
	}

	ifstream file(argv[1]);

	if (!file.is_open())
	{
		cout << "Failed to open " << argv[1] << " for reading\n";
		return 1;
	}

	info author;

	ReadBD(file, author);
	OutId(author);

    return 0;
}

