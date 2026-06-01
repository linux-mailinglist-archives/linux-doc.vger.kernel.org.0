Return-Path: <linux-doc+bounces-90416-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yCC0DkMNHmozgwkAu9opvQ
	(envelope-from <linux-doc+bounces-90416-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 02 Jun 2026 00:52:51 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C29B6626204
	for <lists+linux-doc@lfdr.de>; Tue, 02 Jun 2026 00:52:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1621D309A61E
	for <lists+linux-doc@lfdr.de>; Mon,  1 Jun 2026 22:48:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39219398915;
	Mon,  1 Jun 2026 22:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="OKToZ5+3"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C033133AD99;
	Mon,  1 Jun 2026 22:47:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780354031; cv=none; b=fb71XQfRayR8LfqQ7WXXWRRyTKjVI54KRjxagYkX6uAw5F/Q+kamGlnX2/kMJsvnXObsnhn2qDrYQiVg9xCMwXuK4QPhnjjE2GsdGlzNwNJmZt0asPOPLdh7IS+fMo2L3bNJjlKOly3rmqnUjcK2QKfomndIznKJ4o9dxOimqdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780354031; c=relaxed/simple;
	bh=BygBbCOAOI7ov7eJDxV9YtWjZUBzRtNzeqw4B2lbFQo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IKkpLDAd8vo8j+8dcm5xcya7mQ+6N4V205arGAkiQ76Q4Yz/odOpVNAs42hugGy1TOVy4ZGuz7Ahsq1e/VZ0ZM2JheafN2XzsMxLVvHLHD3BomKL6Imsz6Kt0/XMFVCBy7tefAgHONoLOwk3eg1a7Ua/ML+hAE30I11/2rQizwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=OKToZ5+3; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 85AAB40E00BA;
	Mon,  1 Jun 2026 22:47:07 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id WKoz_Vm_KwY2; Mon,  1 Jun 2026 22:46:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1780354017; bh=9Y4m2W3vRcXKEArbYqkHQd441LGB27Du4H5ZrkX5CSU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OKToZ5+3gGYJPCMAps1wKEkuLcXumWvlhTdWMIlfG1ADqMef5UBqaGfQKKl3yKTh+
	 cEs3M+PIleKF8G36t5n69E4IaZ7XYcWqKC0mvOg6/x4tPQxhpYS75qqUmbLQMOSTe1
	 GqIgRonTFa/IZCYOV9zeKeHOcgXzv20upCjkkg4ZhHpAFd6lwiYlA6jIy7CwXGCZ6f
	 HWnl7JIcFQJ2NjeUOmXiILSe4OqZWiSTr3Ko8uEYSuNLPhIlQzh3ofhOqmoBP3Udq0
	 f1a0dt/fwKsIxaDBePUlTdh+yhwPSi4mbJ05BDApKZrvYlE3A+tARDICCoaXKyzVQS
	 VzXOmpt2ZR92kE03CxEk8A05gOqzCXL8tmYH0CJE+9WC0dWQSGt2EPhS9p1HasKlBs
	 eGTUYOuzNNofWGsqWewDE76CHwDIaQhXRJxKLIK7P96u1Vph3b1KR5wemcNkCGCJ87
	 re8s6+lRlu/FCeaVw/cdv90bjywZEaCyvF7K83wNaWya1biZPyzeMeLTQeGGZB0gzM
	 qDC6U+0FPIcXBO/ja3BK1n+mdPkedublg9EhRzoczftYcjopk4nWsoePN05bccbZQX
	 m44F7z+Pvulj/uYm7Yy2fuYxrwECgnmoY1XKUfRuoCn5osJUTZ/rq/6GuOjtmtuSme
	 Kr2SlJ34d6K0v0p1gFb2FGio=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 86AF340E0032;
	Mon,  1 Jun 2026 22:46:24 +0000 (UTC)
Date: Mon, 1 Jun 2026 15:46:08 -0700
From: Borislav Petkov <bp@alien8.de>
To: Ahmed Tiba <ahmed.tiba@arm.com>
Cc: will@kernel.org, jic23@kernel.org, xueshuai@linux.alibaba.com,
	saket.dumbre@intel.com, mchehab@kernel.org, dave@stgolabs.net,
	djbw@kernel.org, tony.luck@intel.com, guohanjun@huawei.com,
	lenb@kernel.org, skhan@linuxfoundation.org,
	vishal.l.verma@intel.com, rafael@kernel.org, corbet@lwn.net,
	ira.weiny@intel.com, dave.jiang@intel.com, krzk+dt@kernel.org,
	robh@kernel.org, catalin.marinas@arm.com,
	alison.schofield@intel.com, conor+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org, Michael.Zhao2@arm.com,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-cxl@vger.kernel.org, Dmitry.Lamerov@arm.com,
	devicetree@vger.kernel.org, linux-acpi@vger.kernel.org,
	linux-edac@vger.kernel.org, acpica-devel@lists.linux.dev
Subject: Re: [PATCH v5 01/10] ACPI: APEI: GHES: share macros via a private
 header
Message-ID: <20260601224608.GCah4LsNGp3aLjy-xE@fat_crate.local>
References: <20260529-topics-ahmtib01-ras_ffh_arm_internal_review-v5-0-2e0500d42642@arm.com>
 <20260529-topics-ahmtib01-ras_ffh_arm_internal_review-v5-1-2e0500d42642@arm.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260529-topics-ahmtib01-ras_ffh_arm_internal_review-v5-1-2e0500d42642@arm.com>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[alien8.de,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[alien8.de:s=alien8];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-90416-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[32];
	DKIM_TRACE(0.00)[alien8.de:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bp@alien8.de,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[alien8.de:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,fat_crate.local:mid]
X-Rspamd-Queue-Id: C29B6626204
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, May 29, 2026 at 10:50:41AM +0100, Ahmed Tiba wrote:
> Carve the CPER helper macros out of ghes.c and place them in a private
> header so they can be shared with upcoming helper files. This is a
> mechanical include change with no functional differences.

What Sashiko said.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

