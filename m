Return-Path: <linux-doc+bounces-3594-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D37BA7FEF8A
	for <lists+linux-doc@lfdr.de>; Thu, 30 Nov 2023 13:52:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8EE1E281EB2
	for <lists+linux-doc@lfdr.de>; Thu, 30 Nov 2023 12:52:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA0FE2B9A3;
	Thu, 30 Nov 2023 12:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-doc@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lindbergh.monkeyblade.net (Postfix) with ESMTP id EE4DBD7F;
	Thu, 30 Nov 2023 04:52:35 -0800 (PST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4E1621042;
	Thu, 30 Nov 2023 04:53:22 -0800 (PST)
Received: from [10.57.5.51] (unknown [10.57.5.51])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D65BF3F5A1;
	Thu, 30 Nov 2023 04:52:31 -0800 (PST)
Message-ID: <f20c8c30-1379-4706-b980-73d2f7e5912a@arm.com>
Date: Thu, 30 Nov 2023 12:53:30 +0000
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] Simplify Util_est
Content-Language: en-US
To: Vincent Guittot <vincent.guittot@linaro.org>
Cc: hongyan.xia2@arm.com, mingo@redhat.com, alexs@kernel.org,
 linux-kernel@vger.kernel.org, vschneid@redhat.com, bristot@redhat.com,
 bsegall@google.com, rostedt@goodmis.org, dietmar.eggemann@arm.com,
 peterz@infradead.org, juri.lelli@redhat.com, mgorman@suse.de,
 corbet@lwn.net, siyanteng@loongson.cn, qyousef@layalina.io,
 linux-doc@vger.kernel.org
References: <20231127143238.1216582-1-vincent.guittot@linaro.org>
From: Lukasz Luba <lukasz.luba@arm.com>
In-Reply-To: <20231127143238.1216582-1-vincent.guittot@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Vincent,

On 11/27/23 14:32, Vincent Guittot wrote:
> Following comment in [1], I prepared a patch to remove UTIL_EST_FASTUP.
> This enables us to simplify util_est behavior as proposed in patch 2.
> 
> [1] https://lore.kernel.org/lkml/CAKfTPtCAZWp7tRgTpwJmyEAkyN65acmYrfu9naEUpBZVWNTcQA@mail.gmail.com/
> 
> Vincent Guittot (2):
>    sched/fair: Remove SCHED_FEAT(UTIL_EST_FASTUP, true)
>    sched/fair: Simplify util_est
> 
>   Documentation/scheduler/schedutil.rst |  7 +--
>   include/linux/sched.h                 | 35 ++----------
>   kernel/sched/debug.c                  |  7 +--
>   kernel/sched/fair.c                   | 81 ++++++++++-----------------
>   kernel/sched/features.h               |  1 -
>   kernel/sched/pelt.h                   |  4 +-
>   6 files changed, 43 insertions(+), 92 deletions(-)
> 

I recovered my pixel6 and applied these changes.
No power regression in Jankbench. No performance regression in GB5.
Better score in Chrome running Speedometer +3..5%.

The code looks much more clean, without the 'struct util_est'
(we will have to adjust our trace events to that change but it's worth).

Also, I was a bit surprised that the UTIL_EST_FASTUP wasn't helping
that much comparing to that new 'runnable' signal for the
underestimation corner case...

Reviewed-and-tested-by: Lukasz Luba <lukasz.luba@arm.com>

