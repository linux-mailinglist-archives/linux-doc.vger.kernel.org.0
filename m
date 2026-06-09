Return-Path: <linux-doc+bounces-91734-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id MuG2BqBzKGq2EwMAu9opvQ
	(envelope-from <linux-doc+bounces-91734-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 09 Jun 2026 22:12:16 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A9530664089
	for <lists+linux-doc@lfdr.de>; Tue, 09 Jun 2026 22:12:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=fooishbar.org header.s=google header.b=bUQphTXt;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-91734-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-91734-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id EF6533012B1A
	for <lists+linux-doc@lfdr.de>; Tue,  9 Jun 2026 20:12:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C460036680C;
	Tue,  9 Jun 2026 20:12:03 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 628AFCA6F
	for <linux-doc@vger.kernel.org>; Tue,  9 Jun 2026 20:12:02 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781035923; cv=pass; b=ryQX45eCG0yAbxH7w/OvsD4bTAr4j5YHTpyS3BHbX5b3yXhxeauu5ED0vdC0tFpxsI58bdQetKb1AN5nb7VpaxkVInjNl2hFG/Zs0RTILcxzABdGiXORhmQYwMOzzBfYQrfEpYOi8xKlzjfj7rNjtJ/Ny4jXWCevbIK9mKEDCJw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781035923; c=relaxed/simple;
	bh=1TP2hUiA2w4UiubJG1d5nR2maW5WDwIWjpRzO+M+ax0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ToygfxYYO7rTrAcukdDt+HRBt65GcB5Rkez0sd7chVRoDIY/f8Brn2rrbNrGoufW65Jdg2X8NFoVXP25TAaCcVUDU9XZyHo5mg1X6sok95wXRjbE+km/yFR7HiElR9ZfBn9AzGHTK9Os4FvFCUiAHxO5fntfMxO4tvVDgNkAz9s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fooishbar.org; spf=pass smtp.mailfrom=fooishbar.org; dkim=pass (2048-bit key) header.d=fooishbar.org header.i=@fooishbar.org header.b=bUQphTXt; arc=pass smtp.client-ip=209.85.216.45
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-36d8b644473so5773416a91.3
        for <linux-doc@vger.kernel.org>; Tue, 09 Jun 2026 13:12:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781035921; cv=none;
        d=google.com; s=arc-20240605;
        b=kM71obNC7iGyGt5CGpCl31YKaL/4rQVQY6beQeU6ETtqmlUOaxXnj0UxPyGnBQlWOB
         zkqwDZCPmOW+YuV1Wwoxbzq94WKxpYqXsyC9dbt0dvzdrs0w4lrwSEkYmZ014El1MaWx
         hWQfcLPZwIInQzAo//6XLXebUXHlu1oXHE8V4qwHXcvZVy7oolVkQb0L/jnmWrQy/kTU
         YW1c8ogxQB/k3uHZPYWxlZWxqWWVQkAGpSMp/08HXmy8g1AR3VrBBpcpTAp8R4BwJaFy
         6Ww3UT5tgziMh/akwiTqUM47UzoQPEZh5Lr47Bnz9NDrK1LqKX/AfLahg/ACWLBcHlo2
         vAvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=1TP2hUiA2w4UiubJG1d5nR2maW5WDwIWjpRzO+M+ax0=;
        fh=y6nT1dJxo7P33kyrQuMARbuWyDWD7bcbg388zgoX6LI=;
        b=fpB/OlslcPWHoWAk06e1cGdHY+uTvZAVSzgGLl8NE0FQZ/zhoWeY6ezh6nXydqZGEK
         hyx9fWafOiz1gR5LtIxpr4O3rCTOspadz0OEdcc7Jqu+IM1DlxP36PTr3fx2uRhgmDeu
         hUbsnTgyWtjekxADmmQrOE2OTz9+h5DuufiIRC0XDPcKPalqtX9xjFbRQNg7Ng6GjhZJ
         UsrLxVxSCebnuZvspe0sF+9v3zn/ZylpY3WgQyM/kcx72+eCmzzAQ0fFMdj9wBlLE2NX
         EPEjDRNb38BsYZnyg7G9h5iTfJPDHAi7vodX51QqE9ZXOQKq4d/asrF95tPR+3kP5sSF
         IH2A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar.org; s=google; t=1781035921; x=1781640721; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1TP2hUiA2w4UiubJG1d5nR2maW5WDwIWjpRzO+M+ax0=;
        b=bUQphTXtqqxddasQkbS/QrVA9qj2O/R6dFxOlGX5zcEdpEC0acBLPDlmpheqok2pj4
         TG04da6cAe+FQWaHi7A/lOL0XnOwBWHqcUeUujkwikXvm9SavGElnLXJvzg71Bh6OQCJ
         C9VdnmpGvtw03Kx9sLfJpiBEb2m3Q5OtOqj5D+bymhGJtDqXE0nO2UHrkT7OfBq4NRl5
         Bi7YxE7DhBHcVwR8hCGbgUqjFOJ3V/1Ym+yFWoTC61qc2hNrbpzc/zdQ6AENZPbT+K5E
         z/VJwtjdngHrIckO6qlsXrmWPTMfW53MHwzPOBIJoTP1mEvhlKFpfJSjlsavBke1M1sY
         Mt4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781035921; x=1781640721;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1TP2hUiA2w4UiubJG1d5nR2maW5WDwIWjpRzO+M+ax0=;
        b=Z6FlVbS+gCNkZM/5IscjXomVZeRN5Eyk+ka1vsgDqjcSf7zjbkbA/jJTRkxqeGRToj
         WpT/W/rA/BnrdWmwPPGZjx4RRIb21t4XI790kmQgDSlZmzVMUJG4g3LmJlpD43EVSFnr
         CRtcadJyVVCnKYix/XIu7qSpOun3eVBD+0T8FWvHTkQPJRVwtzt8pjvH6oyE5dlnfuPd
         j6TAoF02muSbXvE7q+r9ufc6xRt+5TbIIJIbx9Yqu4PsQlX5bRK4vAIz6zrnfVPrCV8R
         S+1cS53+0yPDF9Yo33ZOzPlVpr2TVGWFSKs3iAJ/b6ZoywvwplFUeanEpXl4q9v/jvud
         Qu5w==
X-Forwarded-Encrypted: i=1; AFNElJ/DEXsn45hBWW94suz0D44PlpOtlM9Iox/I1yIL/cvbABHXW4GWoNfc+93r0FqCvccfE4oooYVe0R8=@vger.kernel.org
X-Gm-Message-State: AOJu0YySKrr469xCMSZ4aBbXnDymuCxHTL4+zlEFm0P/oa9JK3DfEv9p
	okwpl3iTvO1aOaFv+7Kdlv6t/9ZmektCKpNeNwcS6Da4vYZ3VyNonWFFP/o6qoxBQeFRL8SZn3j
	kCATusRGtm3hoeg1H9rKr3t3iLoTLkSYVA66hgXdnog==
X-Gm-Gg: Acq92OGfa8UO0WeTyYLt2Xpk+PVCJ9BurmXEISFfJ/Lz7dcbNlj4xJiVU5Z5vu8wjtF
	eYScMSLld6+ikdv9hgoaiCYAZvFJr4EWJyvUBu5Yq2C01EZxlP9ff7mm5uR1xA+bS7OEoCYRA9/
	LmN3yBz00ZFHNAzqGmNWxx41vpV1TJFdDmfNbNUEfIpXXo09nslV5YpHNthbNKZQGFd5V4d0NVW
	1YifNQ4oaKRuGxarhnRVmXo/cx4xr5L7Hm9GhW3Sb2UUmGoAXpHJ6Jc3RvEMElmgw4Y+iHwMdvd
	wtnv8uyALx+S8l6Imw==
X-Received: by 2002:a17:90b:3bcb:b0:367:cb53:7435 with SMTP id
 98e67ed59e1d1-370f1525ed1mr21923499a91.24.1781035921449; Tue, 09 Jun 2026
 13:12:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260609-color-format-v17-0-35739b5782cc@collabora.com>
In-Reply-To: <20260609-color-format-v17-0-35739b5782cc@collabora.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Tue, 9 Jun 2026 21:11:46 +0100
X-Gm-Features: AVVi8Cf7R-IrVdYhsGfa6ARvQUl6VjYbn-pxlLXZ6UvxdCSIBKSlKWHfn1zLb40
Message-ID: <CAPj87rNhTViuff5qWeoGkPgyRvP0uOAcUGpcJJPTkPR2b8fJcw@mail.gmail.com>
Subject: Re: [PATCH v17 00/28] Add new general DRM property "color format"
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
	Rodrigo Siqueira <siqueira@igalia.com>, Alex Deucher <alexander.deucher@amd.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Sandy Huang <hjc@rock-chips.com>, 
	=?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	Andy Yan <andy.yan@rock-chips.com>, Jani Nikula <jani.nikula@linux.intel.com>, 
	Rodrigo Vivi <rodrigo.vivi@intel.com>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
	Tvrtko Ursulin <tursulin@ursulin.net>, Dmitry Baryshkov <lumag@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Rob Herring <robh@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, kernel@collabora.com, 
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, intel-gfx@lists.freedesktop.org, 
	intel-xe@lists.freedesktop.org, linux-doc@vger.kernel.org, 
	wayland-devel@lists.freedesktop.org, Werner Sembach <wse@tuxedocomputers.com>, 
	Andri Yngvason <andri@yngvason.is>, Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, 
	Marius Vlad <marius.vlad@collabora.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Andy Yan <andyshrk@163.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	R_DKIM_ALLOW(-0.20)[fooishbar.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:nicolas.frattaroli@collabora.com,m:harry.wentland@amd.com,m:sunpeng.li@amd.com,m:siqueira@igalia.com,m:alexander.deucher@amd.com,m:christian.koenig@amd.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:hjc@rock-chips.com,m:heiko@sntech.de,m:andy.yan@rock-chips.com,m:jani.nikula@linux.intel.com,m:rodrigo.vivi@intel.com,m:joonas.lahtinen@linux.intel.com,m:tursulin@ursulin.net,m:lumag@kernel.org,m:s.hauer@pengutronix.de,m:robh@kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:kernel@collabora.com,m:amd-gfx@lists.freedesktop.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-rockchip@lists.infradead.org,m:intel-gfx@lists.freedesktop.org,m:intel-xe@lists.freedesktop.o
 rg,m:linux-doc@vger.kernel.org,m:wayland-devel@lists.freedesktop.org,m:wse@tuxedocomputers.com,m:andri@yngvason.is,m:cristian.ciocaltea@collabora.com,m:marius.vlad@collabora.com,m:dmitry.baryshkov@oss.qualcomm.com,m:andyshrk@163.com,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[daniel@fooishbar.org,linux-doc@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-91734-lists,linux-doc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[45];
	DMARC_NA(0.00)[fooishbar.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[fooishbar.org:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniel@fooishbar.org,linux-doc@vger.kernel.org];
	FREEMAIL_CC(0.00)[amd.com,igalia.com,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,intel.com,linaro.org,ideasonboard.com,kwiboo.se,rock-chips.com,sntech.de,ursulin.net,pengutronix.de,lwn.net,linuxfoundation.org,collabora.com,lists.freedesktop.org,vger.kernel.org,lists.infradead.org,tuxedocomputers.com,yngvason.is,oss.qualcomm.com,163.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-doc];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[fooishbar.org:dkim,fooishbar.org:from_mime,mail.gmail.com:mid,vger.kernel.org:from_smtp,collabora.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A9530664089

Hi Nicolas,

On Tue, 9 Jun 2026 at 13:44, Nicolas Frattaroli
<nicolas.frattaroli@collabora.com> wrote:
> this is a follow-up to
> https://lore.kernel.org/all/20250911130739.4936-1-marius.vlad@collabora.com/
> which in of itself is a follow-up to
> https://lore.kernel.org/dri-devel/20240115160554.720247-1-andri@yngvason.is/ where
> a new DRM connector property has been added allowing users to
> force a particular color format.
>
> That in turn was actually also a follow-up from Werner Sembach's posted at
> https://lore.kernel.org/dri-devel/20210630151018.330354-1-wse@tuxedocomputers.com/
>
> As the number of cooks have reached critical mass, I'm hoping I'll be
> the last person to touch this particular series.

Thanks for seeing this through!

I've pushed this now, minus the Intel patches which they can merge
through their own tree. The AMD tree required a pretty trivial
conflict resolution which seems to work OK here.

Cheers,
Daniel

