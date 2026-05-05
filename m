Return-Path: <linux-doc+bounces-85972-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QCl/MBk2+mlLKwMAu9opvQ
	(envelope-from <linux-doc+bounces-85972-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 05 May 2026 20:25:29 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 244634D29DF
	for <lists+linux-doc@lfdr.de>; Tue, 05 May 2026 20:25:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6495630C8F45
	for <lists+linux-doc@lfdr.de>; Tue,  5 May 2026 18:23:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E798A4A3408;
	Tue,  5 May 2026 18:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vaga.pv.it header.i=@vaga.pv.it header.b="QPWzZ7/2"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-05.mail-europe.com (mail-05.mail-europe.com [85.9.206.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C51A04A3419
	for <linux-doc@vger.kernel.org>; Tue,  5 May 2026 18:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.9.206.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778005389; cv=none; b=p2SqUIg+yhk+g52AV08CGv1UVFShRTbrxHNgz7Gup7g/6NJbgaggNzGlmUBLP6IBJrcMcuYbfIvTM4oUjjoXFqEen5Jzz8m/lhyiVb2gH854/EWQwBfnswXAUSlagSFRLz58kV4iM7LJV8ck6MMKNkbAj/BkrFK6AEJcDmHf8BI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778005389; c=relaxed/simple;
	bh=elWym54amaGJ+H496UxkUuCA8BP/AXXnzi+ilbZupJQ=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pfsCd/ixZA++TF/L5MXb+UUTTq2SqLEWOgdvLhgG5nQ9rzwFYuI1uFDg+wingoxLOfjNecBumGxk2GHr+sQr8E6xCDipt3rkC+JkVitbDcYvpHYWbuJD9xemmohMt6YhS4RyiuBAbQW5dZFdakFI7XkiIzfCu1X98UMX0wxjeDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vaga.pv.it; spf=pass smtp.mailfrom=vaga.pv.it; dkim=pass (2048-bit key) header.d=vaga.pv.it header.i=@vaga.pv.it header.b=QPWzZ7/2; arc=none smtp.client-ip=85.9.206.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vaga.pv.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vaga.pv.it
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaga.pv.it;
	s=protonmail; t=1778005369; x=1778264569;
	bh=JnbKp4jFwvgDhRVP4fnUP8IslF+VxKZMYsgnVgnlyvI=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=QPWzZ7/2M6qJMs8vetRj4WxQOHWGE++L7SqrDLM7pyqbNvc1olQwzpFUSPF5YT++C
	 yUKv7IgLdMmCTH6d8a1Dcj5EI0hXUk1fhnh1/JcgHWX5PZqa510BfWLgdWxaESfh8F
	 7zEDRI4iizoMnpNXje5c+zgnR99fklum7iO0qJII896/BD+hcXTD4PRuaGNkYGS9TL
	 1f7vwm7xIHD818KgalLdFBLf+DrTAXfc8bYXZWx2A19Wja/wFZ9KwYVmdUzZJ1YBSZ
	 qLlBYfXJ5b8exy/isK7x4IJU0ToLo6K2q35VNv7U/msBayhlmUMjxx+lZbOCwIvoK8
	 u42hQNGxV/YAQ==
Date: Tue, 05 May 2026 18:22:45 +0000
To: Jonathan Corbet <corbet@lwn.net>
From: Federico Vaga <federico.vaga@vaga.pv.it>
Cc: Wang Zihan <jiyu03@qq.com>, linux-doc@vger.kernel.org, skhan@linuxfoundation.org, carlos.bilbao@kernel.org, avadhut.naik@amd.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Documentation: translations: Fix "Linux Torvalds" -> "Linus Torvalds"
Message-ID: <iudqx2deqkn7tgnci5img4e2myig36pqaai4mhogtmlr4wbqg5@bnijdnhc4dyb>
In-Reply-To: <87ecjsef3c.fsf@trenco.lwn.net>
References: <tencent_B98271DD90AC356719E15C06ACE473BB820A@qq.com> <87ecjsef3c.fsf@trenco.lwn.net>
Feedback-ID: 124726690:user:proton
X-Pm-Message-ID: 77e9cad57606fb26b2516e55a4ea71cd86dfb6c1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 244634D29DF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[vaga.pv.it,quarantine];
	R_DKIM_ALLOW(-0.20)[vaga.pv.it:s=protonmail];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-85972-lists,linux-doc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FREEMAIL_CC(0.00)[qq.com,vger.kernel.org,linuxfoundation.org,kernel.org,amd.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[federico.vaga@vaga.pv.it,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[vaga.pv.it:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-doc];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qq.com:email,vaga.pv.it:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

On Sun, May 03, 2026 at 08:35:03AM -0600, Jonathan Corbet wrote:
>Wang Zihan <jiyu03@qq.com> writes:
>
>> Fix the misspelling of Linus Torvalds' first name in Italian
>> and Spanish translations.
>>
>> Also fix "Linus Torvald" -> "Linus Torvalds" (missing 's') in
>> Italian translations.
>>
>> Found by Christian Marillat.
>>
>> Signed-off-by: Wang Zihan <jiyu03@qq.com>
>
>The fixes all seem good.  It should have a proper Reported-by line,
>though, and it seems you didn't CC Christian on this email...?

Of course it is all good. Sorry for the typos

--=20
Federico Vaga


