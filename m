Return-Path: <linux-doc+bounces-81198-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aEoDIrDrw2kAvAQAu9opvQ
	(envelope-from <linux-doc+bounces-81198-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 25 Mar 2026 15:05:36 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 332E7326641
	for <lists+linux-doc@lfdr.de>; Wed, 25 Mar 2026 15:05:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1663C31FF4B2
	for <lists+linux-doc@lfdr.de>; Wed, 25 Mar 2026 13:40:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03FE82609E3;
	Wed, 25 Mar 2026 13:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="K017SMH+"
X-Original-To: linux-doc@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB410246BC0;
	Wed, 25 Mar 2026 13:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774446028; cv=none; b=tKXhtDu7zOEo6t1lbrNlrViHyo5gObSFYhh1/ADA/CPae30RoUhG12H9cg7a8i/8aSvyskAOV4TbrST0DHu5fSee3LSmDnpvq+7MjrQ3eDe5r0p0sMWdtAm/0Eelt8k9pdn0i3B4RcY1ZHJktX7vN+7yNbV9Ro4qeP9ZD/j35u4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774446028; c=relaxed/simple;
	bh=mrnMIl7clNTYAgoT6P96ME4wAMKN9lZDOe2dA2wqfFI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=dOCskgMM3ACCqlcaRpQwArLvhqlkhWbg1ESDcucxQIIF1s8MoC+VuYPVklW5bDD/F7CEZ0o+0WwPNNpulJu4864PGLPWJWGyh76WH6H34umLzOtzd2YJ5BKQhwwCQMlcgyGyNj2lFQ4iF7I4ZIGrjY8i+WoqSNVsZbDAVCDKhK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=K017SMH+; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net BCFA241203
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1774446016; bh=mrnMIl7clNTYAgoT6P96ME4wAMKN9lZDOe2dA2wqfFI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=K017SMH+WURXfyQW1XfqF2wOr4cWdccEzQzTmtpn/TS34Qryl2kinPA0J62qmCmnL
	 JyclnKyApcv4WbxL/jf3TAqfInN8YlPhCjlCusaNNMgdqrvwWQobypPFdl6B4N4y3A
	 SVOIgx1gj+eZ4M8nmeYmbOT8RH7jskI5F+/fNgKSrYbjGyBBbIGj3kjdI4SvszYdtm
	 EFLw/C8VhwoEQwp85Vi8zw404BHthpHYZham2/W41v23MyWrgNii9fZWVUJlrrO4vP
	 yYCrWvuOc9InvKoa96yWLBHf1PzIv7cfinwF9kT6XvtZotDFB+IbCfzsihz2ejJISc
	 30nbmLWWd3Vow==
Received: from localhost (mdns.lwn.net [45.79.72.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id BCFA241203;
	Wed, 25 Mar 2026 13:40:16 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Manuel Ebner <manuelebner@airmail.cc>, Collin Funk
 <collin.funk1@gmail.com>, Shuah Khan <skhan@linuxfoundation.org>
Cc: workflows@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/4] workflow, scripts: sort changes.rst and ver_linux
In-Reply-To: <ce9e75d81c6bd67cb2ff92bfd63f9dea0e7980e8.camel@airmail.cc>
References: <20260311164935.183495-3-manuelebner@airmail.cc>
 <87zf46biix.fsf@trenco.lwn.net>
 <ce9e75d81c6bd67cb2ff92bfd63f9dea0e7980e8.camel@airmail.cc>
Date: Wed, 25 Mar 2026 07:40:15 -0600
Message-ID: <878qbgqb7k.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[lwn.net,none];
	R_DKIM_ALLOW(-0.20)[lwn.net:s=20201203];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-81198-lists,linux-doc=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[airmail.cc,gmail.com,linuxfoundation.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DM_SURBL(0.00)[airmail.cc:email];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[corbet@lwn.net,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[lwn.net:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	RCPT_COUNT_FIVE(0.00)[6];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mailbox.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,airmail.cc:email,trenco.lwn.net:mid,spamhouse.org:url]
X-Rspamd-Queue-Id: 332E7326641
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Manuel Ebner <manuelebner@airmail.cc> writes:

> On Tue, 2026-03-17 at 09:08 -0600, Jonathan Corbet wrote:
>> Manuel Ebner <manuelebner@airmail.cc> writes:
>>=20
>> > ...
>> Also, overall, I am still not thrilled about you having send me patches
>> under a false name.=C2=A0 I need you to, at a bare minimum, acknowledge =
that
>> this was a violation of the trust that the kernel project depends on,
>> and that the current name you are using is the real one.
>>=20
>> Thanks,
>>=20
>> jon
>
> Hello Jon,
> unfortunately I have an issue with my e-mail provider. Because of an spam=
house.org
> entry my mails do not show up in the mailing lists.
> Do you mind me changing my e-mail address to manuelebner@mailbox.org

Use whichever address works for you, that is not a problem.

jon

