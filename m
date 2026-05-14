Return-Path: <linux-doc+bounces-87496-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +ItRFqa9BWpZaAIAu9opvQ
	(envelope-from <linux-doc+bounces-87496-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 14 May 2026 14:18:46 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A571D5417FF
	for <lists+linux-doc@lfdr.de>; Thu, 14 May 2026 14:18:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 231CD301052A
	for <lists+linux-doc@lfdr.de>; Thu, 14 May 2026 12:18:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C44103DB96B;
	Thu, 14 May 2026 12:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="Z2lb6/SQ"
X-Original-To: linux-doc@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0156C3C063C;
	Thu, 14 May 2026 12:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778761120; cv=none; b=SIXK3QssX/5U3X/zTft1MYK8IgeYANzlJ3C/Iw/CfseL5x/dqWiXvjFSxoZ7UCsxz75jR7a5dNZoCxmsUrVYKiesK9oypP3M7fzsoVdja/JNCD8HoGYgA0MvuEjCrpuqQBiqthPF3thE1to2Zp6nrzFvbvIKFfusQPwcFh/dTbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778761120; c=relaxed/simple;
	bh=7Ce1dQFNjxZfuSYtyx4eg3KwdQtZxUBgmuZmELs/KaA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=bdCsC1J6jOVMhWrgbkMeu4NA10Zf/9nU4Lr+mxvPUVLzBoQm22yZKyY1M9+phFyTYDGdNqY+OUETpthmV0Whvu8yMeV1bOFW7Xw3tJx+iqrgh8Dc83QzNPsMb/GqqmDUFB7gad1+2RJN5QoVLIf3kWQ83h6Opv8JutXCnl2v0aY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=Z2lb6/SQ; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 9CDD3410B5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1778761116; bh=+NAlYa14LpWq+vBr6UEy9Ob3K0Kek3sjvK31oTD8wEM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Z2lb6/SQs1rSVYxx38HpGECyOXvT19Nn6emhfmaT3/akBrqAJu/Am++QMuzSk3NVb
	 dAJ/ig2fSKjrZ9lT8WZMSeJdAcaAKYjLh6rGyKbnEU699nrV7TaGKhYEujnSYWwnuI
	 k2/EqOpmjBWW9qBrM1gv4BwJ7n+kQd+IancRK689ioqFzlJjQC+sKsaSwAdqhHz1K6
	 KiSPmmCgFeyYLcj0/2X9fc/hFhp9pqt9bBOPUPDhH2yM8UJG8cWPvovq/8jyebYq1I
	 sUG0MU7vavtZFO5xDqXy8H9bTazvxeIzyFLOPXhLnSrDwVOhY2RJddF0jMDTAQcxmy
	 1j6FivMGiwYFQ==
Received: from localhost (unknown [IPv6:2601:280:4600:27b:67c:16ff:fe81:5f9b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 9CDD3410B5;
	Thu, 14 May 2026 12:18:36 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: WangYuli <wangyuli@aosc.io>, Chen-Shi-Hong <eric039eric@gmail.com>,
 linux@leemhuis.info
Cc: skhan@linuxfoundation.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] docs: reporting-issues: replace "these advices" with
 "all of this advice"
In-Reply-To: <e2cced37-58ea-4678-a586-97f9a6db7e9d@aosc.io>
References: <20260514082808.655-1-eric039eric@gmail.com>
 <e2cced37-58ea-4678-a586-97f9a6db7e9d@aosc.io>
Date: Thu, 14 May 2026 06:18:35 -0600
Message-ID: <87zf22uquc.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: A571D5417FF
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[lwn.net,none];
	R_DKIM_ALLOW(-0.20)[lwn.net:s=20201203];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[aosc.io,gmail.com,leemhuis.info];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-87496-lists,linux-doc=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[corbet@lwn.net,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[lwn.net:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	RCPT_COUNT_FIVE(0.00)[6];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,lwn.net:dkim,aosc.io:email]
X-Rspamd-Action: no action

WangYuli <wangyuli@aosc.io> writes:

> I searched the kernel tree for the misspelling "advices" (the word
> "advice" is uncountable) and found the following occurrences:
>
> "
>
>  =C2=A0 >rg-i "advices"
>
> tools/perf/trace/beauty/mmap.c
>  =C2=A0 68: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0static DEFINE_STRARRAY(ma=
dvise_advices, "MADV_");
>  =C2=A0 70: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (behavior < strarray__=
madvise_advices.nr_entries &&=20
> strarray__madvise_advices.entries[behavior] !=3D NULL)
>  =C2=A0 71: =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0return scnprintf(bf, size, "MADV_%s",=20
> strarray__madvise_advices.entries[behavior]);

Please, no.  If you start churning the code in that way you will
certainly get pushback.  Typo fixes are a fine way to learn the process,
but I really hope that contributors will move on quickly to more
substantial work.

Thanks,

jon

