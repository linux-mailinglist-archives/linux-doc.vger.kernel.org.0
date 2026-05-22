Return-Path: <linux-doc+bounces-89034-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sDTiC/aHEGriYwYAu9opvQ
	(envelope-from <linux-doc+bounces-89034-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 22 May 2026 18:44:38 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DE495B7B02
	for <lists+linux-doc@lfdr.de>; Fri, 22 May 2026 18:44:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2100C3016EE8
	for <lists+linux-doc@lfdr.de>; Fri, 22 May 2026 16:40:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D451D4779A7;
	Fri, 22 May 2026 16:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="dPvA3g98"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB06E35DA7B
	for <linux-doc@vger.kernel.org>; Fri, 22 May 2026 16:39:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779468000; cv=none; b=UEbaaHqPoga65XrhHRUDP8bOU3rNA9xoDT+nicC+frcvd4SSUOi2XPyyCgmiPToPpjnW1xSCdJTS54RGRZGewr8ZYeBTGU1vrINayRJcnjwF0awxau32e12Rh/6qT48hwXzYDxPnx/UaEXePpQ70tk+qhPGsM1EFhXDRQ5Hjg6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779468000; c=relaxed/simple;
	bh=8Z3pH1U+yOD8zh30CE+DCdzyq1ZMpaHbgFEs1Oecjss=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=OJhoSh6QWlyc6uvAj/ORY5LfIe2HzGWphP2Zd5EJtGw3DIFLBmAZAmOYbcK88G4N+a9rsUPTjraUe+gyfo7eLQWTFn7coJBnTkncrod2F4VibftbvwZoWMYMBk7JjlYR5KGbHVkdfygXWHZqbBh9XgNmr9TCz6lRUhDzxjihMAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=dPvA3g98; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 4FDDBC5E179;
	Fri, 22 May 2026 16:40:50 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 977756003C;
	Fri, 22 May 2026 16:39:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D437A1081162F;
	Fri, 22 May 2026 18:39:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1779467994; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=8Z3pH1U+yOD8zh30CE+DCdzyq1ZMpaHbgFEs1Oecjss=;
	b=dPvA3g98wV2u7+CgavHPeGmJ4MnDYlqe8UHyr32YpC5WEPoAMZj0M1TFLbmf3wl+ZSrfJb
	QhzNnPg76i/sUD012bP8UKoNLLqUx2M1NVzvXHuhoWIEjTVmM81K6lRUcirIJ72tK/NSoW
	uJ9zxfzupYNDVuuD+omEWD9VaqDzly0kylm4Lmq5s+tnjVAvJ9aWpYUXnlobfak7eirZcR
	6Crge4ZtqfcAoJea3LLow9GSQGm0xxn7DfB8a93dyk8JOQQ7vF5YIvj1WIoxf7Tjj/erWV
	AqKVq4LE65VrvYN2by4rRymXZ1W/pSavIQX8YvGHcMbtX2DTvZYqvAHLsLf+Bw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Pratyush Yadav <pratyush@kernel.org>,  Michael Walle
 <mwalle@kernel.org>,  Takahiro Kuwano <takahiro.kuwano@infineon.com>,
  Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Jonathan Corbet <corbet@lwn.net>,  Shuah Khan
 <skhan@linuxfoundation.org>,  Sean Anderson <sean.anderson@linux.dev>,
  Thomas Petazzoni <thomas.petazzoni@bootlin.com>,  Steam Lin
 <STLin2@winbond.com>,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org,  linux-doc@vger.kernel.org,
  stable@kernel.org
Subject: Re: [PATCH v5 04/28] mtd: spi-nor: swp: Improve locking user
 experience
In-Reply-To: <779f2680-2c67-4bbd-9576-bde8e83d111d@linaro.org> (Tudor
	Ambarus's message of "Fri, 22 May 2026 19:07:53 +0300")
References: <20260507-winbond-v6-18-rc1-spi-nor-swp-v5-0-93453e1a9597@bootlin.com>
	<20260507-winbond-v6-18-rc1-spi-nor-swp-v5-4-93453e1a9597@bootlin.com>
	<9432f07f-3724-4257-b6ab-84721e619f78@linaro.org>
	<875x4fphgr.fsf@bootlin.com>
	<779f2680-2c67-4bbd-9576-bde8e83d111d@linaro.org>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Fri, 22 May 2026 18:39:52 +0200
Message-ID: <87o6i7o0tj.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-89034-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[bootlin.com:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miquel.raynal@bootlin.com,linux-doc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-doc];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,bootlin.com:mid,bootlin.com:dkim]
X-Rspamd-Queue-Id: 7DE495B7B02
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

>> Technically speaking all four first patches are fixes, except I don't
>> ask the first one to be backported. The reason why we ask fixes to be
>> first in the series is because we want them to be as independent as
>> possible from previous cleanups/changes. Here each four first patch are
>> targeting completely different places and should not interact with each
>> other. Anyway, I will re-shuffle the patches.
>
> you don't need to resend just for that I think. Pratyush or Michael can
> re-shuffle when applying.

It's a bit painful to do while applying, I will send a v6.

>> As for Sashiko's feedback, the AI raises the same point as our previous
>> discussion: the QE bit handling is really bad, and I am working on
>
> I forgot what we talked about, sorry.

The fact that there is a helper in the core that blindly sets a
particular QE bit, but this helper might (theoretically) be used by
chips which have the QE bit somewhere else.

I plan on reworking this by storing the location of the QE bit during
SFDP parsing. Then I will use that location in a helper to set or clear
it, which will also be dependent on the QER bitfield. But that field is
a real mess, so I'm not sure it's gonna work :-)

Cheers,
Miqu=C3=A8l

