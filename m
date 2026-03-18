Return-Path: <linux-doc+bounces-80091-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yDODOpcou2kcfwIAu9opvQ
	(envelope-from <linux-doc+bounces-80091-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 18 Mar 2026 23:35:03 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B45B2C380E
	for <lists+linux-doc@lfdr.de>; Wed, 18 Mar 2026 23:35:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 03B2E30217C9
	for <lists+linux-doc@lfdr.de>; Wed, 18 Mar 2026 22:35:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E94041C84B8;
	Wed, 18 Mar 2026 22:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="EsXjktkz"
X-Original-To: linux-doc@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E08403B28D
	for <linux-doc@vger.kernel.org>; Wed, 18 Mar 2026 22:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773873299; cv=none; b=jn4IB+fNQ57wfkFPCgjaKXUAIhWn1o+Oceaj0gn8aKOzJV5F/Cgajyu4FOWH9ASlL0ZYVm0fallz5MKy+XVKP1PGc3SX2Jddu/GRrGAnflSBlL8eckB7On51UOQerFZKIZG2erO0bhMNAFPBI1Hg9Hh2Ic8CSIQ+x6NYSUctmgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773873299; c=relaxed/simple;
	bh=8IifVELJiDKX8Wghq4YauiElS3T+fRUqlQzglMcLgl0=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=FfDl8OUPMfpkiV55DXhwT6/ZwyALkRBNfBHaD8U7g3a+amBGx+iXGUYpBktXFsjX53aaozuYXZ0LDqXrEbx8yCPRIsigGwkSlUXFwo14TGN7LD+NbbgbIK2jjsHDpdy0Kkjxq3PPBzCsjOeXYYYPWr+RPPNMzVcRHED+gUH04lA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=EsXjktkz; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:Subject:From:To:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=TB6NA9v2KqdJQVDWKGJhK5LqBrK7UOlBbQy8RObzjkc=; b=EsXjktkzrj15eHsWYlToZQLlpi
	8UeW1eEBb5VoyKgevxt8XmTW/gIXpaNVGt7KShuU1ov+21KP5Bmvx/nFF/E/KSybFSGpDzV/W6/gk
	psvd2By/emUAyYUxZlSQnyjcIvQuggxgiW2f2MfDzW30DY3kl0n1DzOs2vAhyTIAJZ6y3dxiPiBIh
	Q5hP8UyhV2TuBfA4gN1QA71wFrBLb0ktlRU+QIUnvrh+lg7rgZvWA6N8g26ua4pbo6duzhnaWA0po
	y8fUxid1MJkvtz7hcxl/3s9mlKfknHncVAH5ubUoG2fNQHt/rfxVddUP89JKNDhWhDKZDm0IzyULG
	yNrEjSsw==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2zTe-00000009RLS-1UPF;
	Wed, 18 Mar 2026 22:34:58 +0000
Message-ID: <c7f45144-7068-414f-86dc-3c9971cf6eec@infradead.org>
Date: Wed, 18 Mar 2026 15:34:57 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Linux Documentation <linux-doc@vger.kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Mauro Carvalho Chehab <mchehab@kernel.org>
From: Randy Dunlap <rdunlap@infradead.org>
Subject: docs build version warnings
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[infradead.org,none];
	R_DKIM_ALLOW(-0.20)[infradead.org:s=bombadil.20210309];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-80091-lists,linux-doc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[infradead.org:+];
	TO_DN_ALL(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_THREE(0.00)[3];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rdunlap@infradead.org,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-doc];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,infradead.org:dkim,infradead.org:mid]
X-Rspamd-Queue-Id: 8B45B2C380E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

As of linux-next-20260318, I am getting these version warnings:

/usr/lib/python3.13/site-packages/requests/__init__.py:113: RequestsDependencyWarning: urllib3 (2.6.3) or chardet (6.0.0dev0)/charset_normalizer (3.4.4) doesn't match a supported version!
  warnings.warn(


I have (from OpenSUSE Tumbleweed, rolling updates, updated earlier today):

urllib3			2.6.3-1.2
chardet			6.0.0-1.1
charset_normailzer	3.4.4-1.2

Is this related to docs or just a not-so-good software update?

thanks.
-- 
~Randy


