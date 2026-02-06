Return-Path: <linux-doc+bounces-75563-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yMzqL+NYhmnDMAQAu9opvQ
	(envelope-from <linux-doc+bounces-75563-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 06 Feb 2026 22:10:59 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 21040103551
	for <lists+linux-doc@lfdr.de>; Fri, 06 Feb 2026 22:10:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A4717301F48D
	for <lists+linux-doc@lfdr.de>; Fri,  6 Feb 2026 21:10:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69B7130E830;
	Fri,  6 Feb 2026 21:10:56 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from bmailout2.hostsharing.net (bmailout2.hostsharing.net [83.223.78.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F04C93093D7;
	Fri,  6 Feb 2026 21:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=83.223.78.240
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770412256; cv=none; b=h5GQTgpQkz+azy+hvre8HUuowZKYEr+rTYPXscNp0ESZnEs8mLT47Re+2V2LgLgHoHirAU4IOY/kjQngkfb8Or9byo/M9b5VYPtAyGmNZ61SuCAYLrJano6ZvjmCgARM1cEE0kdfnwu9H9VdA7MvkeZh7pKNOyAaMrUrsiR4oi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770412256; c=relaxed/simple;
	bh=rqvftc6NKAdmy/FYINCo5ZPuutP1eJkXz+ClzPeV8SY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LpgfILqvA2EvGVXHGbaIrdVR6zECt8nk6+QG71hqe7bzwY8MQuZ/ogx024zxKw1viH7XL5fqBHBNIAi0Vo42JGpRjj8gUPHU0diC7ypBCeL4HCMwF8X2FRf7TdMupU44dPmVuFCRSHnTfb9rGO6kCB6T5V9rLppV3NEqXly6KkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de; spf=none smtp.mailfrom=h08.hostsharing.net; arc=none smtp.client-ip=83.223.78.240
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=h08.hostsharing.net
Received: from h08.hostsharing.net (h08.hostsharing.net [83.223.95.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (secp384r1) server-digest SHA384
	 client-signature ECDSA (secp384r1) client-digest SHA384)
	(Client CN "*.hostsharing.net", Issuer "GlobalSign GCC R6 AlphaSSL CA 2025" (verified OK))
	by bmailout2.hostsharing.net (Postfix) with ESMTPS id 246912008014;
	Fri,  6 Feb 2026 22:10:48 +0100 (CET)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
	id 1F9F0473B; Fri,  6 Feb 2026 22:10:48 +0100 (CET)
Date: Fri, 6 Feb 2026 22:10:48 +0100
From: Lukas Wunner <lukas@wunner.de>
To: Keith Busch <kbusch@kernel.org>
Cc: Bjorn Helgaas <helgaas@kernel.org>, Breno Leitao <leitao@debian.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
	Oliver O'Halloran <oohall@gmail.com>,
	Bjorn Helgaas <bhelgaas@google.com>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-pci@vger.kernel.org, dcostantino@meta.com, rneu@meta.com,
	kernel-team@meta.com
Subject: Re: [PATCH] PCI/AER: Add option to panic on unrecoverable errors
Message-ID: <aYZY2KgtSnqUWXbu@wunner.de>
References: <20260206-pci-v1-1-85160f02d956@debian.org>
 <20260206185232.GA70936@bhelgaas>
 <aYY_hMZyVp7GZvX2@kbusch-mbp>
 <aYZU09qCN3u-_byj@wunner.de>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aYZU09qCN3u-_byj@wunner.de>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,debian.org,lwn.net,linux.ibm.com,gmail.com,google.com,vger.kernel.org,lists.ozlabs.org,meta.com];
	TAGGED_FROM(0.00)[bounces-75563-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[wunner.de: no valid DMARC record];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lukas@wunner.de,linux-doc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.991];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[wunner.de:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 21040103551
X-Rspamd-Action: no action

On Fri, Feb 06, 2026 at 09:53:39PM +0100, Lukas Wunner wrote:
> So I wouldn't consider 918b4053184c to have been a universally successful
> approach and I fear that this patch goes even further.

Forgot to mention -- there's another problem:

PCI_ERS_RESULT_NO_AER_DRIVER is obviously AER-specific.

powerpc (EEH) and s390 have error recovery mechanisms separate from AER
and we've been trying to align them more closely so that drivers don't
need to be aware of platform-specific behavior.

eeh_pe_report_edev() does not modify the pci_ers_result for unbound
drivers and those without pci_error_handlers.  And the default is
PCI_ERS_RESULT_NONE.  eeh_report_error() also returns PCI_ERS_RESULT_NONE
for drivers without ->error_detected() callback.

In the PCI_ERS_RESULT_NONE case, EEH seems to perform a reset and
assume successful recovery.

It's only AER that is this strict about unbound devices and drivers that
lack pci_error_handlers.

If anything we should try to *reduce* deviations between the various
error recovery mechanisms, not double down on increasing them.

Thanks,

Lukas

