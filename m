Return-Path: <linux-doc+bounces-2275-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FEA87EA946
	for <lists+linux-doc@lfdr.de>; Tue, 14 Nov 2023 05:01:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BEE2028106E
	for <lists+linux-doc@lfdr.de>; Tue, 14 Nov 2023 04:01:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 264838F6D;
	Tue, 14 Nov 2023 04:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="ZxC88kTf"
X-Original-To: linux-doc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E8018F55
	for <linux-doc@vger.kernel.org>; Tue, 14 Nov 2023 04:01:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 588881A7;
	Mon, 13 Nov 2023 20:01:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:Cc:References:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=ICOM/1lLq6M4iGCToEMqpHVG/JsUrNFcJQW0PHvUXB8=; b=ZxC88kTf/604YrfS788fJtHtdn
	Z/737Rxz+sM+TCTZBaIcuLd413jVv2IZrnJaiGnPzZIimtqLdopv5OpOaUboe9u3T7j7tXROnXZTg
	I1zSCvOTFR9F2f+5ehpidXwVDpzLo64VqszhhIsVmH1mxNr1A2cU03fzUwH6q7FAiZw9t6Wp5YNkY
	BOgnCcbICOqzC54GMJtZ70yDKwRXftEy2KxdTB5T4rhA2ftcdthzMkwo7bdbuylfM5v9DA1v3LGJD
	qYpslw0XN4ZtTfOT5BLDwhF9Mb/6KDVi+Hwh7jqKWcW3NckveZytRmM73es6kgbbLINc/JjTkoQEn
	qZyy06hA==;
Received: from [50.53.46.231] (helo=[192.168.254.15])
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1r2kcA-00F82H-2A;
	Tue, 14 Nov 2023 04:01:26 +0000
Message-ID: <a66a805c-3e1f-4b9a-a38e-aca84b8678a6@infradead.org>
Date: Mon, 13 Nov 2023 20:01:26 -0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC] Add a lockdown_hibernate parameter
Content-Language: en-US
To: Kelvie Wong <kelvie@kelvie.ca>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
References: <20231114022503.6310-1-kelvie@kelvie.ca>
Cc: linux-security-module <linux-security-module@vger.kernel.org>,
 David Howells <dhowells@redhat.com>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20231114022503.6310-1-kelvie@kelvie.ca>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

[add security & dhowells]

On 11/13/23 18:23, Kelvie Wong wrote:
> This allows the user to tell the kernel that they know better (namely,
> they secured their swap properly), and that it can enable hibernation.
> 
> I've been using this for about a year now, as it doesn't seem like
> proper secure hibernation was going to be implemented back then, and
> it's now been a year since I've been building my own kernels with this
> patch, so getting this upstreamed would save some CO2 from me building
> my own kernels every upgrade.
> 
> Some other not-me users have also tested the patch:
> 
> https://community.frame.work/t/guide-fedora-36-hibernation-with-enabled-secure-boot-and-full-disk-encryption-fde-decrypting-over-tpm2/25474/17
> 
> Signed-off-by: Kelvie Wong <kelvie@kelvie.ca>
> ---
>  Documentation/admin-guide/kernel-parameters.txt |  5 +++++
>  kernel/power/hibernate.c                        | 10 +++++++++-
>  2 files changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index 426fa892d311..54785faba9e0 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -2804,6 +2804,11 @@
>  			to extract confidential information from the kernel
>  			are also disabled.
>  
> +	lockdown_hibernate	[HIBERNATION]
> +			Enable hibernation even if lockdown is enabled. Enable this only if
> +			your swap is encrypted and secured properly, as an attacker can
> +			modify the kernel offline during hibernation.
> +
>  	locktorture.nreaders_stress= [KNL]
>  			Set the number of locking read-acquisition kthreads.
>  			Defaults to being automatically set based on the
> diff --git a/kernel/power/hibernate.c b/kernel/power/hibernate.c
> index 89c71fce225d..2221c531d54c 100644
> --- a/kernel/power/hibernate.c
> +++ b/kernel/power/hibernate.c
> @@ -36,6 +36,7 @@
>  #include "power.h"
>  
>  
> +static int lockdown_hibernate;
>  static int nocompress;
>  static int noresume;
>  static int nohibernate;
> @@ -82,7 +83,7 @@ void hibernate_release(void)
>  bool hibernation_available(void)
>  {
>  	return nohibernate == 0 &&
> -		!security_locked_down(LOCKDOWN_HIBERNATION) &&
> +		(lockdown_hibernate || !security_locked_down(LOCKDOWN_HIBERNATION)) &&
>  		!secretmem_active() && !cxl_mem_active();
>  }
>  
> @@ -1340,6 +1341,12 @@ static int __init nohibernate_setup(char *str)
>  	return 1;
>  }
>  
> +static int __init lockdown_hibernate_setup(char *str)
> +{
> +	lockdown_hibernate = 1;
> +	return 1;
> +}
> +
>  __setup("noresume", noresume_setup);
>  __setup("resume_offset=", resume_offset_setup);
>  __setup("resume=", resume_setup);
> @@ -1347,3 +1354,4 @@ __setup("hibernate=", hibernate_setup);
>  __setup("resumewait", resumewait_setup);
>  __setup("resumedelay=", resumedelay_setup);
>  __setup("nohibernate", nohibernate_setup);
> +__setup("lockdown_hibernate", lockdown_hibernate_setup);

-- 
~Randy

