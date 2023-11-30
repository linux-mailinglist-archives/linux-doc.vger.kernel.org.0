Return-Path: <linux-doc+bounces-3597-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B1B47FF068
	for <lists+linux-doc@lfdr.de>; Thu, 30 Nov 2023 14:42:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9279BB20CCA
	for <lists+linux-doc@lfdr.de>; Thu, 30 Nov 2023 13:42:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 779F3482C9;
	Thu, 30 Nov 2023 13:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-doc@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lindbergh.monkeyblade.net (Postfix) with ESMTP id 7171310FF;
	Thu, 30 Nov 2023 05:42:40 -0800 (PST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A5C7F1042;
	Thu, 30 Nov 2023 05:43:26 -0800 (PST)
Received: from [192.168.178.6] (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9424A3F5A1;
	Thu, 30 Nov 2023 05:42:37 -0800 (PST)
Message-ID: <242c8dfd-9030-43a5-abae-ae6e348dec5c@arm.com>
Date: Thu, 30 Nov 2023 14:42:36 +0100
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] sched/fair: Remove SCHED_FEAT(UTIL_EST_FASTUP, true)
Content-Language: en-US
To: Vincent Guittot <vincent.guittot@linaro.org>, mingo@redhat.com,
 peterz@infradead.org, juri.lelli@redhat.com, rostedt@goodmis.org,
 bsegall@google.com, mgorman@suse.de, bristot@redhat.com,
 vschneid@redhat.com, corbet@lwn.net, alexs@kernel.org,
 siyanteng@loongson.cn, qyousef@layalina.io, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org
Cc: lukasz.luba@arm.com, hongyan.xia2@arm.com
References: <20231127143238.1216582-1-vincent.guittot@linaro.org>
 <20231127143238.1216582-2-vincent.guittot@linaro.org>
From: Dietmar Eggemann <dietmar.eggemann@arm.com>
In-Reply-To: <20231127143238.1216582-2-vincent.guittot@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27/11/2023 15:32, Vincent Guittot wrote:
> sched_feat(UTIL_EST_FASTUP) has been added to easily disable the feature
> in order to check for possibly related regressions. After 3 years, it has
> never been used and no regression has been reported. Let remove it
> and make fast increase a permanent behavior.
> 
> Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
> ---
> 
> I haven't updated the chinese documentation which also refers to
> UTIL_EST_FASTUP. IIUC, this will be updated afterward by the 
> Translations' maintainers.
> 
>  Documentation/scheduler/schedutil.rst | 7 +++----
>  kernel/sched/fair.c                   | 8 +++-----
>  kernel/sched/features.h               | 1 -
>  3 files changed, 6 insertions(+), 10 deletions(-)

LGTM.

Reviewed-by: Dietmar Eggemann <dietmar.eggemann@arm.com>


