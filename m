Return-Path: <linux-doc+bounces-91155-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id xJauLbsXI2rDiAEAu9opvQ
	(envelope-from <linux-doc+bounces-91155-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 05 Jun 2026 20:38:51 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 55D9464AAB5
	for <lists+linux-doc@lfdr.de>; Fri, 05 Jun 2026 20:38:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=google.com header.s=20251104 header.b="pVat2Z8/";
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-91155-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-doc+bounces-91155-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=google.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B87663006B3E
	for <lists+linux-doc@lfdr.de>; Fri,  5 Jun 2026 18:30:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E720E368D75;
	Fri,  5 Jun 2026 18:30:09 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6A973A9DA9
	for <linux-doc@vger.kernel.org>; Fri,  5 Jun 2026 18:30:08 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780684209; cv=none; b=Sl6ompvG8Ovc6jvfuJT7bxvo7m0X3oNfzHnNxbjDTfga9sYKnww6tWc8LtT0tGxuxfPtIHf8MEc1TP1vQmQ9BsJtNnAA/Suloi5ayLYJuFUSBnMDJBDSbOOpTzNMLHw5txY8IF5reMvhZvBFjd46u/JPDeDM58yGJZhg7//tB1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780684209; c=relaxed/simple;
	bh=wcy0f2jBXzVCMI2Wm+TBszW9WYGbTiy+Tvaz4GauPjk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WxtmPaBe1Z9XRhhb1XLCMZkc8k7wNiAMU+rYjBtWip4XFLLpa5WqRTgZ2282LXZ+2kTrmKsx7x0BX4813SPkGhS+GmrEf8iCpzTgpSdzMaNKEdtzWJhJlNR/LR7VEVG2DDyHed0C56QjLLHi0bcLVmV5qNFQymF22vU2wb4eSjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pVat2Z8/; arc=none smtp.client-ip=209.85.214.170
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2bf22c18ad3so167145ad.0
        for <linux-doc@vger.kernel.org>; Fri, 05 Jun 2026 11:30:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780684208; x=1781289008; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9KnToTwjIOTIeerw1OtFveTTURV0LHhrMU47MZN/oSk=;
        b=pVat2Z8/cWqe2QjhIsQ78MNIm64/CNBEteK6EVoKNCKT5NS6EOrQ4mG0gxgJAI4fzc
         6tc42nx342W10DrLWeePU0U02k7ttE9vELWNoyGPmVQa0O5JLLFq4WUOLJpVGpRG7rYF
         2xijMDgTe/VsWt0s1iISY6Q+8YEaStSifTFRxCav2reiukGT3UUcVkrL0O5tNnObuIVK
         P6+HrwT0ij1vMgtLGiMRnTF6OcGOtpw6HbVFjdPmwWZSRDvIPjN+2Na/S7HHV8wVJ1sS
         oXm6MD0qKTNTqgThzY8wNwUcEZ1i5Bk83o9YzdtKniW3+id7XPezidpBF1w++6YAUCCW
         YC/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780684208; x=1781289008;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9KnToTwjIOTIeerw1OtFveTTURV0LHhrMU47MZN/oSk=;
        b=YrM1c13tUx20X+Y9wJxcTFiLZ2ac3a5jtRwjSAnXA1OP/jVb6JqQflQVpRaSaq+pjN
         k34q/g+hYNbISLtTQW9kfapHMLyWh/HT/5EXe6SJaSI1V1ghG583BuvJrv3Ytr7IiBGb
         X4o6dPixYnofT6jcCPbmuJh3gPLLJGW49f7oZ03O0ICIAbcjtzHCtlFaMrKNXOxXV6gd
         iWwxsNFAnvwslcCKIjsEn/3s9n/AEoZVgF7V5oMaamiOTGHOSGlCbQs8L1mcJTr0tThY
         5iD/ZNKUdQeysF5pHzTkP22rYYsPWtYnFYH5OGuo8Fbg6DjK/hVt1tlPQVGmzEx67zzl
         FUmg==
X-Forwarded-Encrypted: i=1; AFNElJ//aE5v5EALH8VreSgFyoNkZkUfu2XwKT5bJAS6is9F+p5aeR/r2AQzk7NTx5fVQOTfLkxIfAEFFW8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyLtovcplxjlaZqrwhbE5bdO8nZExzIVkJdtzVL1n7mJ1QCk6a9
	0jKyOeNdaMp0uFB8qCpTvF01QqmPSk4h+WFy69kEJkfzkOFMAFdVYeNsG0kgpwdf7w==
X-Gm-Gg: Acq92OHS/7m9ArXXGWiixyxf07vKGOZCIaaEh1ZFwGQBp9bAfQRhZi+E8QRtvMwAkOD
	cttodOXVEYu5xlVM2xaY+pzx52rFzmt14dgGTpUE/ZbyQp/Ll/+fC/TxWpkN8v41leSFohMIqHy
	0WhbXhDdlPqzK4/OG6VUcCKu5XKPXfwH9aAsod1GdHCGZxhVNI+XHpAjzm1NvEqIj1a+EWslGdm
	M1B7no1nAck+mOknA9fylnWemWQhDODfyNTK9lYIK9zZ+SGfnc+ve2anygWSzPv7ZH2KqN2H3Co
	+Kh16SB9WJz7A8Gcokcs+vawj+jzAswHnTRr4itE891eShmB10de35lX4njbKxnUk5yUKcOenwX
	mBCjBrfz8J9oaQcjolnTia+cKhVFUO4OyLp5bfg6VSdrfPhfKVsF9wcMIzQ146v6mnXhb+1gv70
	TMAYiw0YrAWX2G59AMV0UR5SZc1efVC/5acruutzqAEZtVS64T+jEuRetxP9ZYXG2OIyL5QuzJ8
	Wqnig==
X-Received: by 2002:a17:902:da84:b0:2bf:193b:a195 with SMTP id d9443c01a7336-2c1eb1ded7emr2155935ad.11.1780684207442;
        Fri, 05 Jun 2026 11:30:07 -0700 (PDT)
Received: from google.com (171.46.125.34.bc.googleusercontent.com. [34.125.46.171])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36f6bf827e6sm9411861a91.1.2026.06.05.11.30.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 11:30:06 -0700 (PDT)
Date: Fri, 5 Jun 2026 18:30:02 +0000
From: Sami Tolvanen <samitolvanen@google.com>
To: Michal Gorlas <michal.gorlas@9elements.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Daniel Gomez <da.gomez@kernel.org>,
	Aaron Tomlin <atomlin@atomlin.com>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org
Subject: Re: [PATCH 2/2] module: restrict autoload to CAP_SYS_ADMIN if
 CONFIG_MODULE_RESTRICT_AUTOLOAD
Message-ID: <20260605183002.GB2939956@google.com>
References: <20260515-autoload_restrict-v1-0-40b7c03ddd04@9elements.com>
 <20260515-autoload_restrict-v1-2-40b7c03ddd04@9elements.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260515-autoload_restrict-v1-2-40b7c03ddd04@9elements.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[google.com:+];
	TAGGED_FROM(0.00)[bounces-91155-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:michal.gorlas@9elements.com,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:mcgrof@kernel.org,m:petr.pavlu@suse.com,m:da.gomez@kernel.org,m:atomlin@atomlin.com,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-modules@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[samitolvanen@google.com,linux-doc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[samitolvanen@google.com,linux-doc@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,9elements.com:email,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 55D9464AAB5

On Fri, May 15, 2026 at 07:20:20PM +0200, Michal Gorlas wrote:
> Restrict module auto-loading to CAP_SYS_ADMIN if
> CONFIG_MODULE_RESTRICT_AUTOLOAD is enabled, cmdline parameter
> modrestrict=true, or kernel.modrestrict=1 is set with sysctl.
> 
> Signed-off-by: Michal Gorlas <michal.gorlas@9elements.com>
> ---
>  kernel/module/internal.h |  1 +
>  kernel/module/kmod.c     |  5 +++++
>  kernel/module/main.c     | 11 +++++++++++
>  3 files changed, 17 insertions(+)
> 
> diff --git a/kernel/module/internal.h b/kernel/module/internal.h
> index 061161cc79d9..496d8703f0c6 100644
> --- a/kernel/module/internal.h
> +++ b/kernel/module/internal.h
> @@ -46,6 +46,7 @@ struct kernel_symbol {
>  
>  extern struct mutex module_mutex;
>  extern struct list_head modules;
> +extern bool module_autoload_restrict;
>  
>  extern const struct module_attribute *const modinfo_attrs[];
>  extern const size_t modinfo_attrs_count;
> diff --git a/kernel/module/kmod.c b/kernel/module/kmod.c
> index a25dccdf7aa7..58b28c23f571 100644
> --- a/kernel/module/kmod.c
> +++ b/kernel/module/kmod.c
> @@ -156,6 +156,11 @@ int __request_module(bool wait, const char *fmt, ...)
>  	if (ret)
>  		return ret;
>  
> +	if (module_autoload_restrict && !capable(CAP_SYS_ADMIN)) {
> +		pr_alert("denied attempt to auto-load module %s\n", module_name);

Is pr_alert appropriate here or can this be a warning? Also, use the _ratelimited
variant like the pre-existing warning in this function.

Sami

