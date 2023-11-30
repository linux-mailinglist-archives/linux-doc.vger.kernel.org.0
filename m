Return-Path: <linux-doc+bounces-3591-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CE7AD7FECEA
	for <lists+linux-doc@lfdr.de>; Thu, 30 Nov 2023 11:36:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 69E8FB20F66
	for <lists+linux-doc@lfdr.de>; Thu, 30 Nov 2023 10:36:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27B9820DE8;
	Thu, 30 Nov 2023 10:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-doc@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lindbergh.monkeyblade.net (Postfix) with ESMTP id B69C910DB;
	Thu, 30 Nov 2023 02:36:18 -0800 (PST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0A27C143D;
	Thu, 30 Nov 2023 02:37:05 -0800 (PST)
Received: from [10.57.41.237] (unknown [10.57.41.237])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BB8C93F6C4;
	Thu, 30 Nov 2023 02:36:16 -0800 (PST)
Message-ID: <31b68b10-9819-4c96-a237-ac04887be305@arm.com>
Date: Thu, 30 Nov 2023 10:36:15 +0000
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/3] Documentation: arm64: Document the PMU event
 counting threshold feature
To: James Clark <james.clark@arm.com>, linux-arm-kernel@lists.infradead.org,
 linux-perf-users@vger.kernel.org, will@kernel.org, mark.rutland@arm.com,
 anshuman.khandual@arm.com, namhyung@gmail.com
Cc: Catalin Marinas <catalin.marinas@arm.com>,
 Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20231124102857.1106453-1-james.clark@arm.com>
 <20231124102857.1106453-4-james.clark@arm.com>
Content-Language: en-GB
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20231124102857.1106453-4-james.clark@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 24/11/2023 10:28, James Clark wrote:
> Add documentation for the new Perf event open parameters and
> the threshold_max capability file.
> 
> Signed-off-by: James Clark <james.clark@arm.com>

Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>


> ---
>   Documentation/arch/arm64/perf.rst | 72 +++++++++++++++++++++++++++++++
>   1 file changed, 72 insertions(+)
> 
> diff --git a/Documentation/arch/arm64/perf.rst b/Documentation/arch/arm64/perf.rst
> index 1f87b57c2332..41eee68951ff 100644
> --- a/Documentation/arch/arm64/perf.rst
> +++ b/Documentation/arch/arm64/perf.rst
> @@ -164,3 +164,75 @@ and should be used to mask the upper bits as needed.
>      https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/tools/perf/arch/arm64/tests/user-events.c
>   .. _tools/lib/perf/tests/test-evsel.c:
>      https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/tools/lib/perf/tests/test-evsel.c
> +
> +Event Counting Threshold
> +==========================================
> +
> +Overview
> +--------
> +
> +FEAT_PMUv3_TH (Armv8.8) permits a PMU counter to increment only on
> +events whose count meets a specified threshold condition. For example if
> +threshold_compare is set to 2 ('Greater than or equal'), and the
> +threshold is set to 2, then the PMU counter will now only increment by
> +when an event would have previously incremented the PMU counter by 2 or
> +more on a single processor cycle.
> +
> +To increment by 1 after passing the threshold condition instead of the
> +number of events on that cycle, add the 'threshold_count' option to the
> +commandline.
> +
> +How-to
> +------
> +
> +These are the parameters for controlling the feature:
> +
> +.. list-table::
> +   :header-rows: 1
> +
> +   * - Parameter
> +     - Description
> +   * - threshold
> +     - Value to threshold the event by. A value of 0 means that
> +       thresholding is disabled and the other parameters have no effect.
> +   * - threshold_compare
> +     - | Comparison function to use, with the following values supported:
> +       |
> +       | 0: Not-equal
> +       | 1: Equals
> +       | 2: Greater-than-or-equal
> +       | 3: Less-than
> +   * - threshold_count
> +     - If this is set, count by 1 after passing the threshold condition
> +       instead of the value of the event on this cycle.
> +
> +The threshold, threshold_compare and threshold_count values can be
> +provided per event, for example:
> +
> +.. code-block:: sh
> +
> +  perf stat -e stall_slot/threshold=2,threshold_compare=2/ \
> +            -e dtlb_walk/threshold=10,threshold_compare=3,threshold_count/
> +
> +In this example the stall_slot event will count by 2 or more on every
> +cycle where 2 or more stalls happen. And dtlb_walk will count by 1 on
> +every cycle where the number of dtlb walks were less than 10.
> +
> +The maximum supported threshold value can be read from the caps of each
> +PMU, for example:
> +
> +.. code-block:: sh
> +
> +  cat /sys/bus/event_source/devices/armv8_pmuv3/caps/threshold_max
> +
> +  0x000000ff
> +
> +If a value higher than this is given, then it will be silently clamped
> +to the maximum. The highest possible maximum is 4095, as the config
> +field for threshold is limited to 12 bits, and the Perf tool will refuse
> +to parse higher values.
> +
> +If the PMU doesn't support FEAT_PMUv3_TH, then threshold_max will read
> +0, and both threshold and threshold_compare will be silently ignored.
> +threshold_max will also read as 0 on aarch32 guests, even if the host
> +is running on hardware with the feature.


