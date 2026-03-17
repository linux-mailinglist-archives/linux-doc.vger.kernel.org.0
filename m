Return-Path: <linux-doc+bounces-79756-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gA6tIyVkuWlsCwIAu9opvQ
	(envelope-from <linux-doc+bounces-79756-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 17 Mar 2026 15:24:37 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 490BA2ABD58
	for <lists+linux-doc@lfdr.de>; Tue, 17 Mar 2026 15:24:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id CE93A3130B68
	for <lists+linux-doc@lfdr.de>; Tue, 17 Mar 2026 14:16:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0622A3E1D02;
	Tue, 17 Mar 2026 14:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="P7Iv96k1";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="CMU9Xxi6"
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1D503E5589
	for <linux-doc@vger.kernel.org>; Tue, 17 Mar 2026 14:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773756795; cv=none; b=uwns+aa5dPqwESdhiXda0xEyNbMSFvOhjHsfj1itnJYX5NXA9kodjkplF6nG+UR2BxQUb4jObQbUdwr2Q1zpFNrdCPIyAZIobUQK/lfqq++KEOa4AGalRHnWni4Tgy7aQgASbLE+xUzQsfQn3z870OOqTMqlfn/vqdFHABVqWaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773756795; c=relaxed/simple;
	bh=91BKEugAixdxcjS7gsISaPOceXdhb9ubhvIKgagWg70=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=roGQKq3TLSEZyM7oCX4zDu34m+Gu5jmFJZ/VW4qolN0CZcmEeLMVZVuJnikVYIAIPtDe12HfrECaMCrlUCn/415OCjuuVDi7YDCDawIV/8fg0dhQuQSqlygP6Rw5fsNPjuDQ4bjF0Zishy7pu2UIpvBmk3X2LA9iYhXh4cqBJyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=P7Iv96k1; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=CMU9Xxi6; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773756793;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=91BKEugAixdxcjS7gsISaPOceXdhb9ubhvIKgagWg70=;
	b=P7Iv96k1HFlDwAeuNcJtuj0CdyXvZM5XgsE0chJvJjm/34dT8ogsZOOjS+HqMIZiDkXnO6
	xoYCiC++ZguHBehzJhgklDbBI0enWVKsGfpLI/BvBXdr7SCrWqDFwvML515bJUm5Plj0gN
	NPoaW7Rbwud3p7i0g3LuPIN3DU29rBs=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-614-gvn-QFUbPvKSEs1dVL6qxg-1; Tue, 17 Mar 2026 10:13:12 -0400
X-MC-Unique: gvn-QFUbPvKSEs1dVL6qxg-1
X-Mimecast-MFC-AGG-ID: gvn-QFUbPvKSEs1dVL6qxg_1773756792
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-89c4a339b6bso75907016d6.0
        for <linux-doc@vger.kernel.org>; Tue, 17 Mar 2026 07:13:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1773756792; x=1774361592; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=91BKEugAixdxcjS7gsISaPOceXdhb9ubhvIKgagWg70=;
        b=CMU9Xxi66Y2KWbcs7/D/+TUvxSSZjT1svwLcxNx3PCPtCuXh2UPA2HCSY3g9VeyF0p
         KtMfoGdZ05yl+PuRi77yABP7/VJpB/wIgY09k2yrlPgSyfLCEln0jr7JMd6imMTP3Ww/
         8Y0ThCaCQRfJw+4tTWrXB7sPd1ywmU273p0QVX3Grbik2/0q6g/xMtGCbIK0digSm9mS
         cSP4iLCE6I3ZgCWLZkjpvJstVX9qxbH+hQnw7NspIQQrie6tJr8KBWIb5SiGe1jVm0M7
         dvDvfymZVYHHUqfHMp/4pOlSvOC8Rf0R6MrUZoMlwR+JHsWyO8YxqUh3Gur7XhYQWGyC
         3kOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773756792; x=1774361592;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=91BKEugAixdxcjS7gsISaPOceXdhb9ubhvIKgagWg70=;
        b=BV1AYj71q4PTZ+/mnEe0p5MjsO5sH9ZxtgrJvOlxrpdNQPzvHojr09RmzgKBgPiuwJ
         rKaSnoygTaNB7jud6qqO9ITFY/oaj173P5L0rg92KiRPVQhVgeY4W5p2bVWYgeRtLBQN
         jHA8qbNs9gtXbmca7vQhVyCZMcZe7U/J6eIMtnNog15RJRyUdi9LZG1J9mlawAwbWPXF
         MaDCMnkjkQ2Ma8zf6rMUKRkyylkEur80IY3EVtRL3ydLDmSFIbEtvbdWrzcc0+KmweJ5
         A0CpLhDnRStc1JInOkKzHb21ULYhoc9m04OSrnh9DPQrEcdbwXdpOKiENi77smE+aVSo
         dCsg==
X-Forwarded-Encrypted: i=1; AJvYcCVJU3xYWOTJ4rX59LyEd5chayq6i9gYJqzjKoRoeaB4DlZMhiUKQscZWzR+5nI9yeZBKePVXVA+mnc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxBV9UtnKmmKXa6yTrRDInqps28TE0a7r8t/kCM1TeKnb1dk834
	3mLq1E1aGT1bVHUE6R8vS5lncBsqxci8L1AFCSrW6IQXOFqduU0p1S1v1USfFFEneEj+LH1NFjo
	/kpZVSZoXeRum7q7wEPujTfa15KGyL+kU/+Ut0cXWSyCeVeCA3H8Z1yb4d1LaRg==
X-Gm-Gg: ATEYQzwJVHP9xxFuXy+EslKeEnzPgCp3RjaWGq1PngCdybcihPCwb6YnfLx4+NtNn4l
	UC2x2fA71OIjbYp4Kfv+dM9XZ8rXXOd+jGv4lnJu9DR+RlMNHJzqcHFJI2jRZHz7oxQNVXwOwd/
	W10yaW56pKEQ+RFxATSV/eoWa0Aa0moNO5U5xeuTtGffkReBkB6adYD96bwLBOv1CYHztR2w/Mq
	Juo07cdTMBEjxlzYsk0p77cvWhBoR+DHBxXGbCpo2Y0OlhWmmddzS25KiyDlkevOXdfNZPPwbpg
	v7Xw+WSya9/383aPRr/314gxRnd/bNwERU4q1+OnECG/ItPPxWXdUP7WtWBpPmaWVtCnU3KNFYn
	92hfMonqpMeuKEsNZ3ownEQj+o/IcvlM9qnvlNkQCQ7MR/Ejo2oO9jPw7
X-Received: by 2002:a05:6214:c2f:b0:89c:5bbe:1e73 with SMTP id 6a1803df08f44-89c5e3f07e5mr52990486d6.32.1773756791612;
        Tue, 17 Mar 2026 07:13:11 -0700 (PDT)
X-Received: by 2002:a05:6214:c2f:b0:89c:5bbe:1e73 with SMTP id 6a1803df08f44-89c5e3f07e5mr52989886d6.32.1773756791055;
        Tue, 17 Mar 2026 07:13:11 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89c4feaaedbsm47275346d6.40.2026.03.17.07.13.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 07:13:10 -0700 (PDT)
Date: Tue, 17 Mar 2026 10:13:08 -0400
From: Brian Masney <bmasney@redhat.com>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Maxime Ripard <mripard@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Saravana Kannan <saravanak@kernel.org>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH] clk: add new Kconfig to control default behavior of
 disabling unused clocks
Message-ID: <ablhdKJgEhU8KmtO@redhat.com>
References: <20260316-clk-ignore-unused-kconfig-v1-1-6e95a4fb0c94@redhat.com>
 <20260317-almond-leech-of-correction-2a2ef6@houat>
 <com5zf4bfgb3eoelbmy5pfykhdow6ne3nteua6l7bnzkr72dsb@pehxxygji5z2>
 <20260317-notorious-classic-sunfish-d016d5@houat>
 <2dsd7hq4bn25dibqk62a7o56tt2tecf645tq3upccneq4hby67@cmjjc5d6ximt>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2dsd7hq4bn25dibqk62a7o56tt2tecf645tq3upccneq4hby67@cmjjc5d6ximt>
User-Agent: Mutt/2.3.0 (2026-01-25)
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-79756-lists,linux-doc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[redhat.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bmasney@redhat.com,linux-doc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-doc];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 490BA2ABD58
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 17, 2026 at 03:21:17PM +0200, Abel Vesa wrote:
> The solution has been already discussed for a long time now and it is:
> drop the clk_ignore_unused late_initcall entirely and then make a
> generic sync_state callback that the clock providers can use (or they
> could implement one themselves). This way, until sync_state is reached
> for a specific clock provider driver, all unused clocks remain as is.

I'm willing to work on the sync state support once my clk scaling
series [1] lands upstream. I believe that Saravana posted a series
related to clk sync state, and I need to look at that.

FWIW, the only reason I posted this patch is because at the end of
Stephen's LPC talk I got the impression that this was also an acceptable
change. I'm fine with dropping this change.

[1] https://lore.kernel.org/linux-clk/20260313-clk-scaling-v6-0-ce89968c5247@redhat.com/

Brian


