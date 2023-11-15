Return-Path: <linux-doc+bounces-1730-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D6537E1E0E
	for <lists+linux-doc@lfdr.de>; Mon,  6 Nov 2023 11:15:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AE6061C20AFE
	for <lists+linux-doc@lfdr.de>; Mon,  6 Nov 2023 10:15:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9B881774D;
	Mon,  6 Nov 2023 10:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QPWl+fsy"
X-Original-To: linux-doc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47D5B17730
	for <linux-doc@vger.kernel.org>; Mon,  6 Nov 2023 10:15:11 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCE29A2;
	Mon,  6 Nov 2023 02:15:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699265709; x=1730801709;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=rl/CQQQAEsiExbTArsSNlwkvoXmROn7Y+a5SKI9y6cY=;
  b=QPWl+fsyOU8RRjOKMj0yuPyTfKP0EQqQuJtGm/C8nMcnpD/Wv4V0uQ2U
   ViQPKCoIjwKUDEp6F2XYvHT7CWmiTVH2MGWpdfV3KeEn+HJCjIZJNvDK9
   +JBrSZpWwdLoHep3hsBWv3efPfwjsibTHjW/bVKcJ9pWbQkUHOtKDwu7Y
   aDymtxGfjBM7bKQ7tLZ7Y0EN5WWORkZIB9zI8SyZgFNS+F0ah0GT+DSs8
   j3T2edK1900UINBAOtTSjv1hM8EkTNpfcI76sBAKr40OFBML4dctgrPxj
   XD/+OleAbf87j2j6YghVYFlydSkEn2oKD8n6yWGI2xZYw99kJ63aFk2CP
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="393142060"
X-IronPort-AV: E=Sophos;i="6.03,281,1694761200"; 
   d="scan'208";a="393142060"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2023 02:15:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="797260470"
X-IronPort-AV: E=Sophos;i="6.03,281,1694761200"; 
   d="scan'208";a="797260470"
Received: from lpilolli-mobl.ger.corp.intel.com (HELO localhost) ([10.252.36.222])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2023 02:15:05 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Bagas Sanjaya <bagasdotme@gmail.com>, Randy Dunlap
 <rdunlap@infradead.org>, Hunter Chasens <hunter.chasens18@ncf.edu>, Linux
 Kernel Mailing List <linux-kernel@vger.kernel.org>
Cc: Lijo Lazar <lijo.lazar@amd.com>, Linux Documentation
 <linux-doc@vger.kernel.org>, Xinhui.Pan@amd.com,
 amd-gfx@lists.freedesktop.org, Linux DRI Development
 <dri-devel@lists.freedesktop.org>, alexander.deucher@amd.com,
 evan.quan@amd.com, christian.koenig@amd.com
Subject: Re: [PATCH v1] drm: amd: Resolve Sphinx unexpected indentation warning
In-Reply-To: <ZUigbshGGc451V5L@debian.me>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20231105210044.70371-1-hunter.chasens18@ncf.edu>
 <ZUh2fuCjmgle3vd9@debian.me>
 <665794d7-38e0-4e74-9af7-eca986792e44@infradead.org>
 <ZUigbshGGc451V5L@debian.me>
Date: Mon, 06 Nov 2023 12:15:02 +0200
Message-ID: <875y2f193t.fsf@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Mon, 06 Nov 2023, Bagas Sanjaya <bagasdotme@gmail.com> wrote:
> On Sun, Nov 05, 2023 at 09:26:26PM -0800, Randy Dunlap wrote:
>> 
>> 
>> On 11/5/23 21:15, Bagas Sanjaya wrote:
>> > On Sun, Nov 05, 2023 at 04:00:44PM -0500, Hunter Chasens wrote:
>> >> diff --git a/drivers/gpu/drm/amd/pm/amdgpu_pm.c b/drivers/gpu/drm/amd/pm/amdgpu_pm.c
>> >> index 517b9fb4624c..703fe2542258 100644
>> >> --- a/drivers/gpu/drm/amd/pm/amdgpu_pm.c
>> >> +++ b/drivers/gpu/drm/amd/pm/amdgpu_pm.c
>> >> @@ -990,11 +990,14 @@ static ssize_t amdgpu_get_pp_features(struct device *dev,
>> >>   * the power state and the clock information for those levels. If deep sleep is
>> >>   * applied to a clock, the level will be denoted by a special level 'S:'
>> >>   * E.g.,
>> >> - *	S: 19Mhz *
>> >> - *	0: 615Mhz
>> >> - *	1: 800Mhz
>> >> - *	2: 888Mhz
>> >> - *	3: 1000Mhz
>> >> + *
>> >> + * ::

The literal block marker :: could be added at the end of the preceding
paragraph, so it doesn't stand out so much. See [1].

BR,
Jani.

[1] https://www.sphinx-doc.org/en/master/usage/restructuredtext/basics.html#literal-blocks

>> >> + *
>> >> + *  S: 19Mhz *
>> >> + *  0: 615Mhz
>> >> + *  1: 800Mhz
>> >> + *  2: 888Mhz
>> >> + *  3: 1000Mhz
>> >>   *
>> >>   *
>> >>   * To manually adjust these states, first select manual using
>> > 
>> > LGTM, thanks!
>> > 
>> > Fixes: 615585d09b33 ("Documentation/amdgpu: Modify pp_dpm_*clk details")
>> > Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>
>> > 
>> 
>> but can it be done without being so obvious about using Sphinx (or is it ReST?)
>> in source files?
>
> Yes, the comment is included in Documentation/gpu/amdgpu/thermal.rst, so reST
> syntax applies there.

-- 
Jani Nikula, Intel

