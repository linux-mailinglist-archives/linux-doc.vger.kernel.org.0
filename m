Return-Path: <linux-doc+bounces-77051-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wGKnJgM4n2m5ZQQAu9opvQ
	(envelope-from <linux-doc+bounces-77051-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 25 Feb 2026 18:57:23 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1442119BDC6
	for <lists+linux-doc@lfdr.de>; Wed, 25 Feb 2026 18:57:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 35B44309C299
	for <lists+linux-doc@lfdr.de>; Wed, 25 Feb 2026 17:55:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E95773ECBFC;
	Wed, 25 Feb 2026 17:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="q8xa0Cp2"
X-Original-To: linux-doc@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E24553E8C5F;
	Wed, 25 Feb 2026 17:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772042145; cv=none; b=I4Db2dkDCFiVeDAIoytcgHXxa5BhM847pfdFBzobN3GEZchjl3bcDWaK/NjlYMKRsFqSuejEwPZyKge4AJC3fDeJiT9E3SOKBU0o9uG0AD2kRHiYtvtaXXzrOsJy/slrtv5Pf6ppHofq7lNgWk8JqRIjA7yvQy488cFJjqGJkjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772042145; c=relaxed/simple;
	bh=6m7kOPe1WmqT9Dw0VVtecxsVRfBEHuGKs6Cs22SHmOg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=kmUKD6Eufb6UNMbimo4IfurfRI8aoMw3oAquwZ7D5Nz1wrPfgqXSR5+7YWoph+T0YYkQdEHjkLEoA10cc7LVsbYcyiNND33dLRd2gcMVEKjYIOs5w3zJdhsY4P4TEYurdPhr7A4Qnj+zctINrm3Z35lrE86Xt/GUm7df7lpEvyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=q8xa0Cp2; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 2C74540C7C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1772042144; bh=89reKSYSoKwxxmuLzkRjmLRwtM7KVu/ucpGz+Yxh2aQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=q8xa0Cp2nnUKaZinkeWyDbQBgaXKnS2L1HFMgf9zFSXFQGlYCpfQsEOtimARjLuej
	 vqORp+Tt8BZ8/QyffUu42WsTos+Zwx3s7L9FJWmVqJJJWJO2HAvSBdaz8hq/uHL1BF
	 wCQRrIIwLDNDH7/UEk5Lmkq6DjS9zJhrgKe+TM5L4zypxSCF/MCQHOLAADyvjsOpyZ
	 BJpj9iUjrjmsVOlEwGAjDHmHGaVm54+9T0p0qyOnGBLzFY8UHYrxQpAm1TXwFDlxjM
	 /mEB39QWr+G4zz9UbU/qbxo0mJ4OQt7pwIkovEwVfcdmn3kjuFdwBAMCHU9o49Wp2O
	 yo974SR2M1MFw==
Received: from localhost (c-71-229-227-126.hsd1.co.comcast.net [71.229.227.126])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 2C74540C7C;
	Wed, 25 Feb 2026 17:55:44 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Bhaskar Chowdhury <unixbhaskar@gmail.com>, Julia.Lawall@inria.fr,
 nicolas.palix@imag.fr, skhan@linuxfoundation.org, cocci@inria.fr,
 workflows@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Bhaskar Chowdhury <unixbhaskar@gmail.com>
Subject: Re: [PATCH V2] Doc: dev-tools:  Added Gentoo in the Operating
 system list under Getting Coccinelle
In-Reply-To: <20260222225536.19196-1-unixbhaskar@gmail.com>
References: <20260222225536.19196-1-unixbhaskar@gmail.com>
Date: Wed, 25 Feb 2026 10:55:43 -0700
Message-ID: <87ms0wyag0.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[lwn.net,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[lwn.net:s=20201203];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-77051-lists,linux-doc=lfdr.de];
	FREEMAIL_CC(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com,inria.fr,imag.fr,linuxfoundation.org,vger.kernel.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[lwn.net:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[corbet@lwn.net,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	RCPT_COUNT_SEVEN(0.00)[9];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,trenco.lwn.net:mid,lwn.net:dkim]
X-Rspamd-Queue-Id: 1442119BDC6
X-Rspamd-Action: no action

Bhaskar Chowdhury <unixbhaskar@gmail.com> writes:

>  Adding Gentoo in the operating system list under "Getting Coccinelle".

Applied, thanks.  I also truncated the changelog here, we really don't
need to immortalize your ebuild session.

jon

