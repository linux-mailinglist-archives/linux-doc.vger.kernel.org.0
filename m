Return-Path: <linux-doc+bounces-1941-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EBE647E5A0F
	for <lists+linux-doc@lfdr.de>; Wed,  8 Nov 2023 16:33:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 29F3A1C20919
	for <lists+linux-doc@lfdr.de>; Wed,  8 Nov 2023 15:33:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F9193033C;
	Wed,  8 Nov 2023 15:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="g8VDkOKr"
X-Original-To: linux-doc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AC1830344
	for <linux-doc@vger.kernel.org>; Wed,  8 Nov 2023 15:33:10 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D88E1BF7
	for <linux-doc@vger.kernel.org>; Wed,  8 Nov 2023 07:33:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1699457588;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rf6nrc9vsYtHDq5I7rqs8WEwl7hNFdatKiQNbZDf+3g=;
	b=g8VDkOKr0XP3ThK76YxYh46ygmnGsdOow0artgkwywyyhfP+GSUzp/ilfQdPcUqZyAHWi2
	Ib/WBGVow5e5FTlEYBNKSWrNvtAouaFOhN0WTJOSf4XhFmRLFL+b82djWO6hJKYi2B6Qx4
	4QfFuFZZ7rKC6IfU7udrp9dsk760nbc=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-401-60sdw8gcPkydgOG-nVIhKA-1; Wed, 08 Nov 2023 10:33:07 -0500
X-MC-Unique: 60sdw8gcPkydgOG-nVIhKA-1
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7788fa5f1b0so807752185a.2
        for <linux-doc@vger.kernel.org>; Wed, 08 Nov 2023 07:33:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699457586; x=1700062386;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rf6nrc9vsYtHDq5I7rqs8WEwl7hNFdatKiQNbZDf+3g=;
        b=pAMW2xMhPCg74uN5ERS9jNcd46rHMIOYVif6h6y8YFqi3X4kFn+npVbi/HY+ZaSlUG
         8Ylwvm3IIuFwRLrArisKpBBbfxDRe+0GiSG4xL0diBXFnfypY8wpTmCTrQaJ+vTzqnUj
         JW/nKVNkI3Roagbt1moTZvhi+M81cxFxhH/OworUTQabv+Mmcq6GssNtfOTt8zVyISoW
         /uuu2vjLDSlKqypHtCvL2N1u1yqmxA2L0Tsm/7rdqxgHDRQUyD1sQ3dwPqxvEMzF8Ln+
         jovZkTjTsyJIcaAoskpfWiOB+jVflI0IMhuc8LlQoch6nPa048D4q3d3oRcYU8W93Hy3
         gVaw==
X-Gm-Message-State: AOJu0YxmqhQ4FZQrxvQ2fV59XM7qLbRNSC9Q9HU0/AStiuhsRpqv65BI
	oYFcxf/DKwrV7ZohcMwokIEbhEazlNo+v/vAv9A6MCW4yVxXtzAlrWS5qClkiHfWt9acG6d91Mi
	pADYmMT3DBJxgmHddSTVe
X-Received: by 2002:a05:620a:8dc5:b0:778:8676:fd4 with SMTP id rd5-20020a05620a8dc500b0077886760fd4mr1699430qkn.73.1699457585785;
        Wed, 08 Nov 2023 07:33:05 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG6+BHcCtTk+c77Z73UHj9SPsJMvP2BWpv0J7CHG6xq4hFwJfpUL1R+bNHPV3nSkAX2/jop9g==
X-Received: by 2002:a05:620a:8dc5:b0:778:8676:fd4 with SMTP id rd5-20020a05620a8dc500b0077886760fd4mr1699410qkn.73.1699457585421;
        Wed, 08 Nov 2023 07:33:05 -0800 (PST)
Received: from [10.16.200.42] (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id f16-20020ae9ea10000000b0076ee973b9a7sm1152477qkg.27.2023.11.08.07.33.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Nov 2023 07:33:04 -0800 (PST)
Message-ID: <69d0dc4f-5ff5-4cda-a272-71b890db5bc8@redhat.com>
Date: Wed, 8 Nov 2023 10:33:04 -0500
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/2] docs: Update kernel-parameters.txt for signature
 verification enhancement
Content-Language: en-US
To: "Alessandro Carminati (Red Hat)" <alessandro.carminati@gmail.com>,
 linux-modules@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Luis Chamberlain <mcgrof@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
References: <20230914112739.112729-1-alessandro.carminati@gmail.com>
 <20230914112739.112729-3-alessandro.carminati@gmail.com>
From: Prarit Bhargava <prarit@redhat.com>
In-Reply-To: <20230914112739.112729-3-alessandro.carminati@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/14/23 07:27, Alessandro Carminati (Red Hat) wrote:
> Update kernel-parameters.txt to reflect new deferred signature
> verification.
> Enhances boot speed by allowing unsigned modules in initrd after
> bootloader check.
> 
> Signed-off-by: Alessandro Carminati (Red Hat) <alessandro.carminati@gmail.com>
> ---
>   Documentation/admin-guide/kernel-parameters.txt | 9 +++++++++
>   1 file changed, 9 insertions(+)
> 
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index 0c38a8af95ce..beec86f0dd05 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -3410,6 +3410,15 @@
>   			Note that if CONFIG_MODULE_SIG_FORCE is set, that
>   			is always true, so this option does nothing.
>   
> +	module_sig_check_wait=
> +			This parameter enables delayed activation of module
> +			signature checks, deferring the process until userspace
> +			triggers it. Once activated, this setting becomes
> +			permanent and cannot be reversed. This feature proves
> +			valuable for incorporating unsigned modules within
> +			initrd, especially after bootloader verification.
> +			By employing this option, boot times can be quicker.
> +

Please keep these in alphabetical order.

Would making the kernel-parameters.txt warning a little bit more 
informative be a good thing?  This should only be used in environments 
where some other signature verification method is employed.

Also, for future reference, it would be good to have hard numbers to 
show the boot time improvement in the changelog.

P.

>   	module_blacklist=  [KNL] Do not load a comma-separated list of
>   			modules.  Useful for debugging problem modules.
>   


