Return-Path: <linux-doc+bounces-84972-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IPI4AI/P8GnDYwEAu9opvQ
	(envelope-from <linux-doc+bounces-84972-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 28 Apr 2026 17:17:35 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DFAD487A9A
	for <lists+linux-doc@lfdr.de>; Tue, 28 Apr 2026 17:17:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8FB0F302560A
	for <lists+linux-doc@lfdr.de>; Tue, 28 Apr 2026 13:45:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FD8A2D77E6;
	Tue, 28 Apr 2026 13:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="BMze1Xss"
X-Original-To: linux-doc@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6134523E330;
	Tue, 28 Apr 2026 13:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777383921; cv=none; b=rxEFo0j22bUt+Zl41VVWdnnpJmtlJpScHac2YpAPF3ACrMnC4U1gXWKL1OJLWHnTFI30+IwPEkLCnOMDZ76jahYzPbtNTMmpV3h/52JgRVcffqTnpxnD5tL55pduut9+YEqvPx9xz/zlDxDt5Qk2B9Lhu9TbvI6BfwbiPeF/u5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777383921; c=relaxed/simple;
	bh=bLWwxXRB5mYFl09msN5/Yo6oGlf1YyIH5Pmkbbe1q/E=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=fOPFxYs210+tIgz5FznpPCzSk1o5PIJxNpLoqBBGmBItEMuRW2bZoc9WQ1O2bwJ1mCpxCyeM6Ax/KjHpk6eQNDIhhKX7/qsmdv9GjNL6HEF9Dp88dB/a1m8M+mgA7dx6k4M2OdgSscKkewNp/cEauY3p/p+LhuEqz6Eks+zYZfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=BMze1Xss; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 5071E4108F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1777383919; bh=bLWwxXRB5mYFl09msN5/Yo6oGlf1YyIH5Pmkbbe1q/E=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=BMze1XssfAQLEXCMFcGoVlKES7VWnZMIaAylWSmf9XtkjmhLEBAOxA5Gyy5FwA0xp
	 knvoN2ZEqWdOrdkdSpHotQW7Ms+KaOw3jmxn0VHfWl3XnlH50YmRvmXoVam9pjpmv9
	 qpA/jhPefbPxAQhlojq9/nKgsQMj023QhoI6GtOVdwjZ312r94/FRve3ost58rT9UQ
	 BpAG7oheZpD33jwz7QMEF67xQ08+exESkRlctNm5upY4o2WiYbP2swHy/XC7n9j/dV
	 /leoEE+yANkqA0GaUAbPxUIZnNMUpeanjAnkL3ob618Qh0RegH0f2HFT/kLAxbukE2
	 crrU7wZfYYk1g==
Received: from localhost (mdns.lwn.net [45.79.72.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 5071E4108F;
	Tue, 28 Apr 2026 13:45:18 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Ilai Levin <levinilai972@gmail.com>, Marc Zyngier <maz@kernel.org>
Cc: skhan@linuxfoundation.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: driver-api: eisa: add SPDX license identifier
In-Reply-To: <CADjj9EMZgsVKbfUvfXjerbkXYgj6WPvzd_bMpP517_o3WdcvXQ@mail.gmail.com>
References: <20260428124555.102039-1-levinilai972@gmail.com>
 <871pfzmedp.fsf@trenco.lwn.net> <86wlxrz04x.wl-maz@kernel.org>
 <CADjj9EMZgsVKbfUvfXjerbkXYgj6WPvzd_bMpP517_o3WdcvXQ@mail.gmail.com>
Date: Tue, 28 Apr 2026 07:45:15 -0600
Message-ID: <87o6j3kxlg.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 2DFAD487A9A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[lwn.net,none];
	R_DKIM_ALLOW(-0.20)[lwn.net:s=20201203];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-84972-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[lwn.net:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[corbet@lwn.net,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[5]

Ilai Levin <levinilai972@gmail.com> writes:

> Hi Marc,
>
> Thanks for confirming.
>
> Jon, should I send a v2 adding Marc=E2=80=99s Acked-by, or is this suffic=
ient?

No need for a resend, it will get picked up.

Thanks,

jon

