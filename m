Return-Path: <linux-doc+bounces-81197-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YF3dKFnlw2mwugQAu9opvQ
	(envelope-from <linux-doc+bounces-81197-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 25 Mar 2026 14:38:33 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 8905A325ED5
	for <lists+linux-doc@lfdr.de>; Wed, 25 Mar 2026 14:38:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id AB9413002B1F
	for <lists+linux-doc@lfdr.de>; Wed, 25 Mar 2026 13:31:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CDF623AB98;
	Wed, 25 Mar 2026 13:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=airmail.cc header.i=@airmail.cc header.b="sVnOChlq"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail.cock.li (mail.cock.li [37.120.193.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2765C22576E;
	Wed, 25 Mar 2026 13:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=37.120.193.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774445488; cv=none; b=RpXTP7rjss6afuwjcbviTTQYRwykdqoKoC4+usq6JbQ1SzaBIjKHWdFZIP3oC0gZXpRzWcOj5dB0dsomei8+x2rZ45QgX2YXOYxX0kHH81b8EjTlDJ+juBGVrjrLJA9QllLx2T6JhrSSYOANXFrsd1ZKotjfc+uWmHRb+XZcvzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774445488; c=relaxed/simple;
	bh=q3tuWp1RLUYTJrvvPpp6oNTO7zyjhWAmE56QxTrEU0E=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=r7nZE/hULAXr80T5T0qG5xYv1c5qVBzS1EosVb6YBCyMYYbJIrAR0OgZPiqvqgB1JuaGM6pGV1FupoMMNen0Az8c0+exIoNg/mMt9/ep4SU9go0iGwreM4TZqyXGFjkP3FoRX4rlardyzavfaEPgLQhVbO3fsX7G+V5y6Fk2xy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=airmail.cc; spf=pass smtp.mailfrom=airmail.cc; dkim=pass (2048-bit key) header.d=airmail.cc header.i=@airmail.cc header.b=sVnOChlq; arc=none smtp.client-ip=37.120.193.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=airmail.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=airmail.cc
Message-ID: <ce9e75d81c6bd67cb2ff92bfd63f9dea0e7980e8.camel@airmail.cc>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=airmail.cc; s=mail;
	t=1774445477; bh=q3tuWp1RLUYTJrvvPpp6oNTO7zyjhWAmE56QxTrEU0E=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=sVnOChlqcqEm/oeUDO1JzdJw0W1WOl1DIRaNy0dj2SlZ4VLGnDq/PlplqciN7BZcO
	 JP+RL/t9vqng2PCQig1P6MEbFbwRPS9khnlqq14RVp3I5Qb1P02utQc/IVvJZMBnpv
	 aQJE3lO87LM/3qpA6imy2jtgusV/7v/r6SLQuqwPTPyxQSmCg1bsko1jf71kuIDKkW
	 iJwdopd+Ef1NJ5x9zzWIlRcB4vxIJS6QbVZhpfDqJZcq/FbM7QMQdI5D7218kn/kF3
	 8YFtfNUm10ULDgKARzcu+YyQ73mrDSAfQmGdOEd1pf/Intpct24XOXYsWXiRP2aR4o
	 G45nwhXj5B94w==
Subject: Re: [PATCH v4 0/4] workflow, scripts: sort changes.rst and ver_linux
From: Manuel Ebner <manuelebner@airmail.cc>
To: Jonathan Corbet <corbet@lwn.net>, Collin Funk <collin.funk1@gmail.com>, 
 Shuah Khan <skhan@linuxfoundation.org>
Cc: workflows@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Date: Wed, 25 Mar 2026 14:30:54 +0100
In-Reply-To: <87zf46biix.fsf@trenco.lwn.net>
References: <20260311164935.183495-3-manuelebner@airmail.cc>
	 <87zf46biix.fsf@trenco.lwn.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43app1) 
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[airmail.cc,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[airmail.cc:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-81197-lists,linux-doc=lfdr.de];
	FREEMAIL_TO(0.00)[lwn.net,gmail.com,linuxfoundation.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	DM_SURBL(0.00)[airmail.cc:dkim,airmail.cc:email,airmail.cc:mid];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[manuelebner@airmail.cc,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[airmail.cc:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-doc];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,mailbox.org:email,spamhouse.org:url,airmail.cc:dkim,airmail.cc:email,airmail.cc:mid]
X-Rspamd-Queue-Id: 8905A325ED5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, 2026-03-17 at 09:08 -0600, Jonathan Corbet wrote:
> Manuel Ebner <manuelebner@airmail.cc> writes:
>=20
> > ...
> Also, overall, I am still not thrilled about you having send me patches
> under a false name.=C2=A0 I need you to, at a bare minimum, acknowledge t=
hat
> this was a violation of the trust that the kernel project depends on,
> and that the current name you are using is the real one.
>=20
> Thanks,
>=20
> jon

Hello Jon,
unfortunately I have an issue with my e-mail provider. Because of an spamho=
use.org
entry my mails do not show up in the mailing lists.
Do you mind me changing my e-mail address to manuelebner@mailbox.org

Manuel

