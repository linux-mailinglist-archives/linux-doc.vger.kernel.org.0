Return-Path: <linux-doc+bounces-86922-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qIwvMi4/Amo/pgEAu9opvQ
	(envelope-from <linux-doc+bounces-86922-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Mon, 11 May 2026 22:42:22 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id D16E4515F6F
	for <lists+linux-doc@lfdr.de>; Mon, 11 May 2026 22:42:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 861F83008CBB
	for <lists+linux-doc@lfdr.de>; Mon, 11 May 2026 20:42:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20BD53A641E;
	Mon, 11 May 2026 20:42:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="hCqSjoUF"
X-Original-To: linux-doc@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B929437C914;
	Mon, 11 May 2026 20:42:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778532137; cv=none; b=U+bbVTX140cTUyjdY1gZJKHOrw+Fe/0iDDVwWFiQr3c4pa58zzQ9nPixD9Obge6ud+NpMsQ0MjJXxkGlLKpGjGFDujn0bb7Vy9FniD/OCds76UnbU5+FYDXHuD+JgAMObs8OraEx3oeIaISJWLOgHj5gQmG3ARIjXL0bRygkvPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778532137; c=relaxed/simple;
	bh=TNek+Vy0SPPGQeL6lJycHd2bHVq/8XtZApMP43e3w8Y=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Vum/rHYZtjmqxGUg8itayjY9abpx848tBIokroBL3YlAiVXDHEwsnSynTFxGWo0jFSsn/MfaYQScssxFrHoNIKwX/v7cxDRJ4geJvpanbWBEixkeaJdWUdo2aoG0CxmP4Kn4IaWcT0HS0Nm17ynVMREhhXp+ClB+X8AlaPXr8Lo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=hCqSjoUF; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net D76DB40C7C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1778532135; bh=bjEirsDdfpedPl8hqqxa10zJ87UyMtd7EoLdj/YUP4U=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=hCqSjoUFOIzzBlQA+3wvrK0IG9bIDeBfvLu71QL5vtNtNAmKOkDMdLM0QdgsrPw4z
	 7/m7RUBRbwzshHZpmO+K2vb6npoCstc6kHmLO/n6hdppkhzQJpFbVAzxVz6v+5lfYo
	 opOnF40UygM7z/cL0Px9XzjG/Q9nafK6J31CzlKqMQxPgGiBx2JCKpuSvAbo+k2Q7q
	 aLi6ZlLQTgdXNc6J60V7pkna6tl9AaQaIMyzTbtZC/Ri5lFlc0ezgQQkCB25774ShQ
	 1nTlxhxjD1S0Jz0KNBNuiEj2gPXk7F+9IJ6SXp433zhd/3lRJAKzm8Guw2Wswel4k4
	 oo61+A7crwWqQ==
Received: from localhost (c-71-229-227-126.hsd1.co.comcast.net [71.229.227.126])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id D76DB40C7C;
	Mon, 11 May 2026 20:42:14 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Willy Tarreau <w@1wt.eu>
Cc: Greg KH <greg@kroah.com>, Leon Romanovsky <leon@kernel.org>,
 skhan@linuxfoundation.org, security@kernel.org, workflows@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] Documentation: security-bugs: explain what is
 and is not a security bug
In-Reply-To: <agI7XogSmfN_Pm4t@1wt.eu>
References: <20260509094755.2838-1-w@1wt.eu>
 <20260509094755.2838-3-w@1wt.eu> <2026051124-afar-renewal-795c@gregkh>
 <agIZ8zeg3m0xE3yL@1wt.eu> <878q9pvlif.fsf@trenco.lwn.net>
 <agI7XogSmfN_Pm4t@1wt.eu>
Date: Mon, 11 May 2026 14:42:14 -0600
Message-ID: <87a4u5u195.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Rspamd-Queue-Id: D16E4515F6F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[lwn.net,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[lwn.net:s=20201203];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-86922-lists,linux-doc=lfdr.de];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[lwn.net:+];
	MISSING_XM_UA(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[corbet@lwn.net,linux-doc@vger.kernel.org];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,1wt.eu:email,trenco.lwn.net:mid]
X-Rspamd-Action: no action

Willy Tarreau <w@1wt.eu> writes:

>> I can ship stuff Linusward quickly too... :)  But it's fine if Greg
>> takes it, of course.
>
> Oh that's fine then. I thought you only delivered such updates into next
> releases. I'm fine with either way of course! Let's pick the path of
> least effort for each.

That's my normal procedure, since there are few docs changes that have
greater urgency, but I do have a "fixes" branch.

Greg, what's your preference?  Unless I hear otherwise, I guess I'll
apply it shortly.

Thanks,

jon

