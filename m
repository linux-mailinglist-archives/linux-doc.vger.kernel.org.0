Return-Path: <linux-doc+bounces-96744-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id tNUdEJMyVmr41AAAu9opvQ
	(envelope-from <linux-doc+bounces-96744-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 14 Jul 2026 14:58:59 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B905A754C94
	for <lists+linux-doc@lfdr.de>; Tue, 14 Jul 2026 14:58:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=resnulli-us.20251104.gappssmtp.com header.s=20251104 header.b=wupdiznG;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-96744-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-96744-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2CB40300898B
	for <lists+linux-doc@lfdr.de>; Tue, 14 Jul 2026 12:58:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65C9E44DB64;
	Tue, 14 Jul 2026 12:58:56 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D5E744CAC9
	for <linux-doc@vger.kernel.org>; Tue, 14 Jul 2026 12:58:54 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784033936; cv=none; b=DozEl6QFG+hafaPKa1Gf+mra7J2/cUrAWNa5sCNkxFjSh/ijNa8/EIHYM/8ESW7Y3BsyHVZQeCYiVmYqrJ1unb1AEyHlcDECo5vBZivTwvL5KsL49U5X2ZrzxZbzNEQiEOQHEpmasaDlqgGO9Uk/ElIjZ6MDzZ4hLdGgm0Cy6bo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784033936; c=relaxed/simple;
	bh=kh3suqL/Cm8hQIsIKe0J8PGLIi3c5/TsdDTB9lcKtKk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZvDRTbbtwQrKjIvRExdY0VRDgqdnODY2Taca5MJP/DzRVCS2NaRI0hV1WTxNV0eUF1dW/tK7/O/r7VflLckDLTitFIFzhXj5l2XRd3W67fx1zMmAOK9QmW8omelHfT4h140yy2kKnOicBqhiOciTLPGzl7LTTbwL/zJ5bCrEx0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20251104.gappssmtp.com header.i=@resnulli-us.20251104.gappssmtp.com header.b=wupdiznG; arc=none smtp.client-ip=209.85.208.180
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-39c74722e27so10234271fa.0
        for <linux-doc@vger.kernel.org>; Tue, 14 Jul 2026 05:58:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20251104.gappssmtp.com; s=20251104; t=1784033932; x=1784638732; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kh3suqL/Cm8hQIsIKe0J8PGLIi3c5/TsdDTB9lcKtKk=;
        b=wupdiznGcYprahXhJW6o2Is6dB5DIVNgFItm+8Dj7MbdAfl1s6OvBIUfebvG2V+m9a
         QSqwEV90UhhC2b8sXapkBBoDZM8Wv7m+itT3Lsja1S2VYPrKhlxJ1ImFSMZZsMNRcxLR
         O8i+3nb2dVQ1vXmDDIxlB9TaBgYKL7T0NAS3dncZ0shUO2sRTceSjeS87E9NhJ6pM7MG
         7tJ/j4mC5XdLYSi3irSeuRbK0Eo3Hv9JZWzDQ8Pl5owlIhUWCdBTE6xWNDyBi6n2unIr
         AbpMXilmsHktYItX2xrRyHre7F8bsr6zzaBC8P163uLE5bDeyIE0HxtkmLcmNCsPdvIN
         lK3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784033932; x=1784638732;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kh3suqL/Cm8hQIsIKe0J8PGLIi3c5/TsdDTB9lcKtKk=;
        b=K7SihDlwsWPOgUexwMjIJck9+yfKpeNWjopzsDAuorG3A8lQzkucxC6g+rhChyJkE7
         jXFxBxhM45I+kuZF3AqPp3/Ow1TZd7uAUtx6b5ivOy6k9V/GWZkCbdnzb9d5S2tBreE8
         dkLLb2Oe510ARHDgYztaJI4U4YZNotlg0vbI7gQzmDq9LtJlMP9QgeViqk3qS6Wsc9kl
         /NHjcs8hiLeydpmcjTMuQaFgNQrXKmB6AKBvnOdP6wI7FAlan+jfUDJ7N1RaDoIIxBDq
         FfT4unEoiHVyuJy0Hpoj9POfkPn81j6TMnK8Nx9ZE3R2NIjnJPb19a7feSsD9D1mtXdb
         dD/Q==
X-Forwarded-Encrypted: i=1; AHgh+RoUgqq0bLxcB71/VtGhCBDXim4GXJjOU+fxSb7562zyZnWWKBAehiTKz2Zn0XDrNeaiEb2hdR+bK1g=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5o39icX5JZ0HgxUpVzStMaPaMm1/XGRENfohdVqJUfsX3lErZ
	kCuuqVo7G6oFEyqnq9Y3nAEGdudVs81wcvKEuj+RkpgAPvLqYO4TIloyvRCnK7TlbxU=
X-Gm-Gg: AfdE7ckauRlT+EqUvbbZkLIrz7kXFJhYayaWr1NgBmAipC1pXBfogoFORrmo4u9skJ2
	5TRagIbQCvm4NkIATEEoagfP8+MoT5ByXAcs0MBEvnNjifx3+RxqkrOUcqsr2T4GS9jsyVPsksn
	7lK+zrkSp5GyPvJAMwA9nBSq88epGMfVmVY2b9jsxyYg0PwdA8EwtaVhCC5FEfPvVpUR7iPl6SW
	sjTwC5W5zQ7153zJLMEAd2WAEw4x41XYNFPoA3gzZ/eDQI3iHMMFGoS2E68FvcYaM2aM1dCamRc
	tghrKjiFK6oEWZs0OrD2JrZBqsZYU/o7XS+gNTBtnooG+4O8Uzll3sZapxfkqSf2VC0UAP8rBPB
	nRZl86ZzpauDUcZAEINLFRM7ankDxs4HnbudWUPpSuZ0qGCwtmfGGurBACkT14s2xC7NAY9U139
	qeCDtubhHbw2ixcZxqlVWe1PNWfF0t0rm0Bg==
X-Received: by 2002:a05:651c:b26:b0:39c:753a:853f with SMTP id 38308e7fff4ca-39ca9f115d0mr30337311fa.3.1784033932550;
        Tue, 14 Jul 2026 05:58:52 -0700 (PDT)
Received: from localhost ([140.209.217.211])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39c849174ebsm32107621fa.7.2026.07.14.05.58.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 05:58:52 -0700 (PDT)
Date: Tue, 14 Jul 2026 14:58:45 +0200
From: Jiri Pirko <jiri@resnulli.us>
To: Mark Bloch <mbloch@nvidia.com>
Cc: Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Saeed Mahameed <saeedm@nvidia.com>, Leon Romanovsky <leon@kernel.org>, 
	Tariq Toukan <tariqt@nvidia.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, netdev@vger.kernel.org, 
	linux-rdma@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH net-next V6 2/4] devlink: Factor out eswitch mode setting
Message-ID: <alYygM-2f4NB0uJA@FV6GYCPJ69>
References: <20260714061731.531849-1-mbloch@nvidia.com>
 <20260714061731.531849-3-mbloch@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260714061731.531849-3-mbloch@nvidia.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[resnulli-us.20251104.gappssmtp.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[jiri@resnulli.us,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:mbloch@nvidia.com,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:horms@kernel.org,m:saeedm@nvidia.com,m:leon@kernel.org,m:tariqt@nvidia.com,m:andrew+netdev@lunn.ch,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:netdev@vger.kernel.org,m:linux-rdma@vger.kernel.org,m:linux-doc@vger.kernel.org,m:andrew@lunn.ch,s:lists@lfdr.de];
	DMARC_NA(0.00)[resnulli.us];
	TAGGED_FROM(0.00)[bounces-96744-lists,linux-doc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jiri@resnulli.us,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[resnulli-us.20251104.gappssmtp.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc,netdev];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B905A754C94

Tue, Jul 14, 2026 at 08:17:28AM +0200, mbloch@nvidia.com wrote:
>Move the common eswitch mode set checks into a small helper and use it
>from the netlink eswitch set command. This makes the same validation
>available to the devlink core path that applies eswitch mode defaults.
>
>Signed-off-by: Mark Bloch <mbloch@nvidia.com>

Reviewed-by: Jiri Pirko <jiri@nvidia.com>

