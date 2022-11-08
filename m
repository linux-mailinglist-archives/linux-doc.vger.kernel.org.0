Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E8DA9620CAC
	for <lists+linux-doc@lfdr.de>; Tue,  8 Nov 2022 10:50:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233736AbiKHJtu (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Tue, 8 Nov 2022 04:49:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233762AbiKHJtt (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 8 Nov 2022 04:49:49 -0500
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA55DE4
        for <linux-doc@vger.kernel.org>; Tue,  8 Nov 2022 01:49:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667900988; x=1699436988;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=iC+onxNy7KNgKEzOFYTssykgkV5jyGSsB6F/1ba4UZ0=;
  b=VmZwpVODJbAWMxsVheh8gZwI0nRY3kfIqAyFjBhRReNZky9g/Gs0E3zN
   GhrO67dBkPMEK4RfutACZJ38aEXu01R8R82sXEnUjXyxwYiJsR34i2EZb
   0vALxX8V7bZ6wEtBpuH5rVR7YAmTQjx7vk9ljyENZmo7JP1kaH5EqTDsw
   O538kSma9MVgvG3tbWE2jmxoi6f5CyCpi55JGx3Bgfu+uHmaU8k7hopun
   TAskVrZyCGDZDf8yg9KXVib9icB+3DFoCVEPbuIP1/4y687DaC5ajjlkU
   VZoPyLFuflVOYNgbwYwzNJSoRpvvCnHM22JoZX494kzhjXqQBZXjumsUo
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10524"; a="312445512"
X-IronPort-AV: E=Sophos;i="5.96,147,1665471600"; 
   d="scan'208";a="312445512"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2022 01:49:48 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10524"; a="811182308"
X-IronPort-AV: E=Sophos;i="5.96,147,1665471600"; 
   d="scan'208";a="811182308"
Received: from shylandx-mobl2.ger.corp.intel.com (HELO [10.213.210.50]) ([10.213.210.50])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2022 01:49:46 -0800
Message-ID: <ee6f2ae9-9420-1c91-a029-644cb8ac85e0@linux.intel.com>
Date:   Tue, 8 Nov 2022 09:49:45 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH 1/3] Documentation/gpu: Fix section in the wrong scope
Content-Language: en-US
To:     Lucas De Marchi <lucas.demarchi@intel.com>,
        dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
        linux-doc@vger.kernel.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>
References: <20221107173209.2219571-1-lucas.demarchi@intel.com>
 <20221107173209.2219571-2-lucas.demarchi@intel.com>
From:   Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <20221107173209.2219571-2-lucas.demarchi@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HK_RANDOM_ENVFROM,HK_RANDOM_FROM,
        NICE_REPLY_A,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


On 07/11/2022 17:32, Lucas De Marchi wrote:
> That section should still be inside "DRM client usage stats" rather than
> as a sibling.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>   Documentation/gpu/drm-usage-stats.rst | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/Documentation/gpu/drm-usage-stats.rst b/Documentation/gpu/drm-usage-stats.rst
> index 92c5117368d7..b46327356e80 100644
> --- a/Documentation/gpu/drm-usage-stats.rst
> +++ b/Documentation/gpu/drm-usage-stats.rst
> @@ -126,7 +126,6 @@ percentage utilization of the engine, whereas drm-engine-<str> only reflects
>   time active without considering what frequency the engine is operating as a
>   percentage of it's maximum frequency.
>   
> -===============================
>   Driver specific implementations
>   ===============================
>   

Oops - yep.

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Regards,

Tvrtko
