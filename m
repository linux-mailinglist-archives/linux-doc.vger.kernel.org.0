Return-Path: <linux-doc+bounces-38974-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 44564A3FE4C
	for <lists+linux-doc@lfdr.de>; Fri, 21 Feb 2025 19:09:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8AC38440E41
	for <lists+linux-doc@lfdr.de>; Fri, 21 Feb 2025 18:07:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B86F2512C5;
	Fri, 21 Feb 2025 18:07:28 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF027250C14;
	Fri, 21 Feb 2025 18:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740161248; cv=none; b=GtGf2H1stUr4A3O6ojMbtcrooO7R0visw8K1EO6qB9IhzPTLKBEadA0w7A6Di2PfrrPDsBApfjtb+7RtP4N7qF34uWgSiYwc827jMMerC6fsUm92opQe1q3LrvhrbyQQiWDorGSm3bqflZPA3anUxaPZn7SKEOLSMR/eE+Q2BQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740161248; c=relaxed/simple;
	bh=R5j7lMnqjWWqlhW3Nf6rSZip+gdyDBu9pA5mCqAJgwY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AsmEafyiWh8SkRDKQHaXJaHs1VfKzZhFLQjKlLkgv9U+nJB/A7SVBZSTTP/NN5mpYQgFqZBgZfP72QUT6Pd5sDZNNE9JdQqzwZynvFln4x661hnYTyFUzZ0yR0qM+iHGN0PUdYZrOSzWlWzXOoW/Gq+1yyJ0v8bKYLyirFxYNWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F184E1EA6;
	Fri, 21 Feb 2025 10:07:43 -0800 (PST)
Received: from [10.1.197.49] (eglon.cambridge.arm.com [10.1.197.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CEEA33F59E;
	Fri, 21 Feb 2025 10:07:21 -0800 (PST)
Message-ID: <aef8e061-8754-4bf9-86eb-18c0bacc6476@arm.com>
Date: Fri, 21 Feb 2025 18:07:20 +0000
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 11/23] x86/resctrl: Introduce mbm_cntr_cfg to track
 assignable counters at domain
To: Babu Moger <babu.moger@amd.com>, corbet@lwn.net,
 reinette.chatre@intel.com, tglx@linutronix.de, mingo@redhat.com,
 bp@alien8.de, dave.hansen@linux.intel.com, tony.luck@intel.com,
 peternewman@google.com
Cc: fenghua.yu@intel.com, x86@kernel.org, hpa@zytor.com, paulmck@kernel.org,
 akpm@linux-foundation.org, thuth@redhat.com, rostedt@goodmis.org,
 xiongwei.song@windriver.com, pawan.kumar.gupta@linux.intel.com,
 daniel.sneddon@linux.intel.com, jpoimboe@kernel.org, perry.yuan@amd.com,
 sandipan.das@amd.com, kai.huang@intel.com, xiaoyao.li@intel.com,
 seanjc@google.com, xin3.li@intel.com, andrew.cooper3@citrix.com,
 ebiggers@google.com, mario.limonciello@amd.com, tan.shaopeng@fujitsu.com,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 maciej.wieczor-retman@intel.com, eranian@google.com
References: <cover.1737577229.git.babu.moger@amd.com>
 <30652061d4a21eb5952a1323b76ca70927412a30.1737577229.git.babu.moger@amd.com>
Content-Language: en-GB
From: James Morse <james.morse@arm.com>
In-Reply-To: <30652061d4a21eb5952a1323b76ca70927412a30.1737577229.git.babu.moger@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Babu,

On 22/01/2025 20:20, Babu Moger wrote:
> In mbm_cntr_assign mode hardware counters are assigned/unassigned to an
> MBM event of a monitor group. Hardware counters are assigned/unassigned
> at monitoring domain level.
> 
> Manage a monitoring domain's hardware counters using a per monitoring
> domain array of struct mbm_cntr_cfg that is indexed by the hardware
> counter	ID. A hardware counter's configuration contains the MBM event
> ID and points to the monitoring group that it is assigned to, with a
> NULL pointer meaning that the hardware counter is available for assignment.
> 
> There is no direct way to determine which hardware counters are	assigned
> to a particular monitoring group. Check every entry of every hardware
> counter	configuration array in every monitoring domain to query which
> MBM events of a monitoring group is tracked by hardware. Such queries
> are acceptable because of a very small number of assignable counters.

> diff --git a/include/linux/resctrl.h b/include/linux/resctrl.h
> index 511cfce8fc21..9a54e307d340 100644
> --- a/include/linux/resctrl.h
> +++ b/include/linux/resctrl.h
> @@ -94,6 +94,18 @@ struct rdt_ctrl_domain {
>  	u32				*mbps_val;
>  };
>  
> +/**
> + * struct mbm_cntr_cfg - assignable counter configuration
> + * @evtid:		 MBM event to which the counter is assigned. Only valid
> + *			 if @rdtgroup is not NULL.
> + * @rdtgroup:		 resctrl group assigned to the counter. NULL if the
> + *			 counter is free.
> + */
> +struct mbm_cntr_cfg {
> +	enum resctrl_event_id	evtid;
> +	struct rdtgroup		*rdtgrp;
> +};

struct rdtgroup here suggests this shouldn't be something the arch code is touching.

If its not needed by any arch specific code, (I couldn't find a resctrl_arch helper that
takes this) - could it be moved to resctrl's internal.h.

(If this does need to be visible to the arch code, one option would be to replace rdtgroup
with the closid/rmid, and a valid flag so that memset() continues to reset these entries)


Thanks,

James

