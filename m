Return-Path: <linux-doc+bounces-87401-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0CmUFwPFBGqbNwIAu9opvQ
	(envelope-from <linux-doc+bounces-87401-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 13 May 2026 20:37:55 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 47132539151
	for <lists+linux-doc@lfdr.de>; Wed, 13 May 2026 20:37:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 101A73030D3A
	for <lists+linux-doc@lfdr.de>; Wed, 13 May 2026 18:37:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85A053AEF43;
	Wed, 13 May 2026 18:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="L+JVn93l"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86DF22E719C
	for <linux-doc@vger.kernel.org>; Wed, 13 May 2026 18:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778697377; cv=none; b=dWNn4faMqUyxDbqXRVu6zfjjd0vnhLNe4ees1gtMg3zaTBICQxWbkdLz01Uk78yYzJnXU9BqRq8hseVYKMX6GaR92Mx2gvekSqxiX3NJMU6R5IfDRUD7miuALxveOq97gczWZ/3gl4cOgZI9Etk+ZDFiQYDpP/muSVYJA4xLAr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778697377; c=relaxed/simple;
	bh=rO3h1Z0IMdUe40XbniH7Syeq4c4URoeuKQNA3ehrqjo=;
	h=Date:Message-ID:MIME-Version:Content-Type:From:To:Subject:
	 References:In-Reply-To; b=FFhX+IhkZef9ouPUIJEkbkOKiNjch4aHSuZUTlJ5J7sZxJ8oMaxV6bK8EGQeV1U7UTmtMBqucN4yegywZj0ptNXf7jm7221tsaiazRXr8kIDiydibzld+738BKLahKjy9pRAoh8NLLGuhbU1KhtmKj+9NavnCAgU3uNCzeh4HOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=L+JVn93l; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-50e5c7eb565so68834771cf.3
        for <linux-doc@vger.kernel.org>; Wed, 13 May 2026 11:36:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1778697373; x=1779302173; darn=vger.kernel.org;
        h=in-reply-to:references:subject:to:from:content-transfer-encoding
         :mime-version:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P2T1YkP403+tJ+X3WhxlPcahyNJiY7q6QXlcKSX4nKU=;
        b=L+JVn93ljCggkMDRrMmIQOy+ciQrWxjROtkJXOeNISU2XT6bdwnTLW9cnFpAOCb3qW
         hj7l6kus1Tg5JCyvFnieHdneRhoG0MZZiR8Gg6MYf6IUkX+C1oI7ex3/+pl6lwYz762+
         0dZ29t1CW5vj79bKQsDAn96DY9FuVB0+jfEh696a39fkEwg1Q1Gd6kGZ2LwZrSX5ZjT9
         YEbdx8lvyMeF8EtQer+i20Xj4UYzmDU59TcYoOCR1y693DT9Vy0Hsw2jGIPh5ZRR1gNG
         V+Xdy8dBcmPk9EYc6uZL73a38kbvOgELR9YtJrKFI1hs8qF+b+mDxrjAepdXSbimsOmX
         Cw0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778697373; x=1779302173;
        h=in-reply-to:references:subject:to:from:content-transfer-encoding
         :mime-version:message-id:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P2T1YkP403+tJ+X3WhxlPcahyNJiY7q6QXlcKSX4nKU=;
        b=k5Ig+xki1Qosn2H0RZIVpsP3ubsUiJdXoT071gVyfvQZBmx5Y+qDVja6E26Dxuihla
         seqgrl3R0hhnrmVdqfxx7+hlSLMR+gESfZOe3YLIzALhYkpFBNGMDo9NWJHux/ivORc+
         IiCCEoMoHSqIjJngxI3xpHV/pOUuQL5FA3EBhcUrzESvoYcVunm9dT6n7aKxsJJ64UA2
         2hmaxne/CGt5wUFh0/ILYxb++eGKmXABzVX5WwJcyHaElokqGMW2LvOssiL7nscGgc51
         XPKqvK+xeyRjR2q5gzJKQJTO0JUAICltK91nkvC20sSwT13MR5JwVnwV/wTbKaGhcs55
         27kg==
X-Forwarded-Encrypted: i=1; AFNElJ+9cYcQW28Dz94OfWd4lC5PH/wYX+5irCDEoBVp5OnMIQi1nG+87qsl8hEYT5GEdk8dncfzaU7stAQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+4fyqP5fbzImM65ReYTHKoIXHEc/0YOGBFORL3AD8ny5y3vwR
	Q170b1yhZL9cuukqFMIXarTNV5eTE05DNNk7HM0mfs7Ksn6lJZB6aoZZpgUTX7R5tw==
X-Gm-Gg: Acq92OEaGxSNeX7mdHtkVUdD/WCv5rihjxjYtpsYi6/4qhrz1EdqSLp4NLTpL5zFuzG
	sXspFrI4uiQ5Ipos2lms+IkypQqq2iGLiUX+5/DHlFfBfuv1paTT69M+GCU7RCcN6tyIMzED/1/
	RgBumCEUrYNLdxkTJ0PevBMIOfmrSZ1Sw7wBfBnpAYtsFIKpRAkPXIgKUeovU6WgtsAxxdmsN2m
	cyhEJPnvP/EKRPUiVHFQ0oShjgxlyRdpwrF0zbN2V+6FZdiWKobG9gJ1GI07Ty42UoqmKUGEVi/
	bMsxfm5FejyACeRnLHVYPIq6Y5xC1b4ZloV2jNuDb7ACqc4RDTsmRu8G91gP+rEKRRBY7+s02cJ
	9Rt7OjNPE/Fu3yqiSFiDw6LuhiM11H7OmiRPycVXrUdGpuUnKwwUP/kP7vHxzToXqJ/8ShHNEI4
	FzlD0mPXS38P9bXRFF95JsdimwC8EgqfBu4JJZ/yIU5fp+W/nLjPFssWLgqPgrWKF3hxEz5hTrE
	ayIijo=
X-Received: by 2002:a05:622a:6d06:20b0:516:3183:c1fc with SMTP id d75a77b69052e-5163183cb11mr38795191cf.50.1778697373350;
        Wed, 13 May 2026 11:36:13 -0700 (PDT)
Received: from localhost (pool-71-126-255-178.bstnma.fios.verizon.net. [71.126.255.178])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8c90bb82a7asm2888936d6.37.2026.05.13.11.36.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 11:36:10 -0700 (PDT)
Date: Wed, 13 May 2026 14:36:09 -0400
Message-ID: <f367fe9b2695df27e47f4836d0f51fbf@paul-moore.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 
Content-Type: text/plain; charset=UTF-8 
Content-Transfer-Encoding: 8bit 
X-Mailer: pstg-pwork:20260512_1604/pstg-lib:20260513_1343/pstg-pwork:20260512_1604
From: Paul Moore <paul@paul-moore.com>
To: Blaise Boscaccy <bboscaccy@linux.microsoft.com>, "Blaise Boscaccy" <bboscaccy@linux.microsoft.com>, "Jonathan Corbet" <corbet@lwn.net>, "" , "James Morris" <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>, =?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net>, =?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack@google.com>, "Dr. David Alan Gilbert" <linux@treblig.org>, "Andrew Morton" <akpm@linux-foundation.org>, James.Bottomley@HansenPartnership.com, dhowells@redhat.com, "Fan Wu" <wufan@kernel.org>, "Ryan Foster" <foster.ryan.r@gmail.com>, "Randy Dunlap" <rdunlap@infradead.org>, linux-security-module@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, bpf@vger.kernel.org, "Song Liu" <song@kernel.org>
Subject: Re: [PATCH v7 5/10] lsm: security: Add additional enum values for bpf  integrity checks
References: <20260507191416.2984054-6-bboscaccy@linux.microsoft.com>
In-Reply-To: <20260507191416.2984054-6-bboscaccy@linux.microsoft.com>
X-Rspamd-Queue-Id: 47132539151
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[paul-moore.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[paul-moore.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-87401-lists,linux-doc=lfdr.de];
	FREEMAIL_TO(0.00)[linux.microsoft.com,lwn.net,namei.org,hallyn.com,digikod.net,google.com,treblig.org,linux-foundation.org,HansenPartnership.com,redhat.com,kernel.org,gmail.com,infradead.org,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[paul@paul-moore.com,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[paul-moore.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-doc];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[paul-moore.com:mid,paul-moore.com:url,paul-moore.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On May  7, 2026 Blaise Boscaccy <bboscaccy@linux.microsoft.com> wrote:
> 
> First add a generic LSM_INT_VERDICT_FAULT value to indicate a system
> failure during checking. Second, add a LSM_INT_VERDICT_UNKNOWNKEY to
> signal that the payload was signed with a key other than one that
> exists in the secondary keyring. And finally add an
> LSM_INT_VERDICT_UNEXPECTED enum value to indicate that a unexpected
> hash value was encountered at some stage of verification.
> 
> Signed-off-by: Blaise Boscaccy <bboscaccy@linux.microsoft.com>
> ---
>  include/linux/security.h | 3 +++
>  1 file changed, 3 insertions(+)

Merged into lsm/dev, thanks.

--
paul-moore.com

