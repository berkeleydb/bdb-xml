//
// See the file LICENSE for redistribution information.
//
// Copyright (c) 2002,2009 Oracle.  All rights reserved.
//
//

#ifndef __UPGRADECOMMAND_HPP
#define	__UPGRADECOMMAND_HPP

#include "ShellCommand.hpp"

class UpgradeCommand : public ShellCommand
{
public:
	UpgradeCommand() {};
	virtual ~UpgradeCommand() {};

	virtual std::string getCommandName() const;
	virtual std::string getBriefHelp() const;
	virtual std::string getMoreHelp() const;
	
	virtual void execute(Args &args, Environment &env);
};

#endif
