/*
 * Copyright (c) 2001-2008
 *     DecisionSoft Limited. All rights reserved.
 * Copyright (c) 2004-2008
 *     Oracle. All rights reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * $Id: ContextUtils.cpp 475 2008-01-08 18:47:44Z jpcs $
 */

#include "../config/xqilla_config.h"
#include <xqilla/utils/ContextUtils.hpp>
#include "DateUtils.hpp"

#include <string.h>

int ContextUtils::getTimezone()
{
	time_t tt;
	time(&tt);

	struct tm tm;
	DateUtils::threadsafe_gmtime(&tt, &tm);

	struct tm ltm;
	DateUtils::threadsafe_localtime(&tt, &ltm);

	return (((int)tt - (int)mktime(&tm)) / 60 +
		/*daylight saving time*/(ltm.tm_isdst > 0 ? 1 * 60 : 0)) *
		DateUtils::g_secondsPerMinute;
}
