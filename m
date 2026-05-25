Return-Path: <linux-doc+bounces-89402-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cNbWGemwFGrRPQcAu9opvQ
	(envelope-from <linux-doc+bounces-89402-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 25 May 2026 22:28:25 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 636885CE5D8
	for <lists+linux-doc@lfdr.de>; Mon, 25 May 2026 22:28:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id EC989300406F
	for <lists+linux-doc@lfdr.de>; Mon, 25 May 2026 20:28:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBC78393DC0;
	Mon, 25 May 2026 20:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="K4fWzHOW"
X-Original-To: linux-doc@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 948E03939BF;
	Mon, 25 May 2026 20:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779740897; cv=none; b=tPPXo59gX+ers/Sszhd2QrcUiVznfPGYvrcVHoy2prGag4KIDhDIYnY4vle2L3y2dneAWa1DreQnEfkBOJUlwwxlSimdMDh2AuKZyAYtv0bwfj5AKoHtjMLGGQB0gWb3Kbnx0n4m6z3dB57P0GLP+6/mQlt9yLITQnjWrepJvR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779740897; c=relaxed/simple;
	bh=a0MjrN2Qp76Y0c0kJw+9+19I/rF8lBW2dCYk008IBd8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=qT0IFW/4rt6iyRxl2LuwEDMQl4sUzq3BR3Rkt+KB6d93D/XPQ+5ZxwBD7yR7TC2hdwAhGCWvZU+L102Z+YWybxX3WFv2PttTRGKSEINJXVxT9f4P8+I6fSopFSJcMzS1r81CAIuqQJQjY7hPaZVfnBaOPgvTSAom7YgM6HFu4Dk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=K4fWzHOW; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 029A440E36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1779740896; bh=mRuq6xd2cRHm2JrEX7p6lt7YLPqwA9dU21jfzVcX+E0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=K4fWzHOW8/ssUb90fHsbLcBNHZpjP1unqFdTuVMODbhM5Di8J3rEQtdGZ8gGSnsIl
	 SCOCDBApq2Oouyh0VYR4hGHcZgOWVf+jCE5nIYmRUHinTv2HwUXnLmQUtobCADi/MV
	 xXKV9Q9FRfaqhAOZmRTIPLt/WU88bju/W3VPnmzLEUAatNlf5XV4Uo1O89KDhIzmIc
	 cUFc0etAHU+7SNRaQTdz/lHbBjEooQxiqqi7EmU68S47Y/g8ySb/SLBvB/XKYfyc48
	 7Fvln9beHXB02c5NhIPPGr2bvWTiRNcO508UGoGapCnTPkrv3BImYI4b7LlTNPkU/r
	 uC32Db3v6DBHA==
Received: from localhost (unknown [IPv6:2601:280:4600:27b:67c:16ff:fe81:5f9b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 029A440E36;
	Mon, 25 May 2026 20:28:15 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Mauro Carvalho Chehab
 <mchehab@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Shuah Khan
 <skhan@linuxfoundation.org>
Subject: Re: [PATCH 0/2] Two small cleanups to maintainers_include
In-Reply-To: <cover.1778952682.git.mchehab+huawei@kernel.org>
References: <cover.1778952682.git.mchehab+huawei@kernel.org>
Date: Mon, 25 May 2026 14:28:15 -0600
Message-ID: <87qzmzz128.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[lwn.net,none];
	R_DKIM_ALLOW(-0.20)[lwn.net:s=20201203];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-89402-lists,linux-doc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[lwn.net:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[corbet@lwn.net,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.908];
	TAGGED_RCPT(0.00)[linux-doc,huawei];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,lwn.net:dkim,trenco.lwn.net:mid]
X-Rspamd-Queue-Id: 636885CE5D8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:

> Hi Jon,
>
> This series contain two minor cleanups to maintainers_include.py:
>
> - make it backward compatible with Python < 3.10
>   (according with vermin, it should now be backward-compat up
>    to 3.6)
>
> - keep "THE REST" at the end.
>
> Mauro Carvalho Chehab (2):
>   docs: maintainers_include: restore compatibility with Python 3.6
>   docs: maintainers_include: keep the last entry at the end
>
>  Documentation/sphinx/maintainers_include.py | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)

Applied, thanks.

jon

