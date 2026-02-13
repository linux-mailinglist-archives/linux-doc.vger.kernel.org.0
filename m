Return-Path: <linux-doc+bounces-75984-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yL3ZE6Akj2m6KAEAu9opvQ
	(envelope-from <linux-doc+bounces-75984-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 13 Feb 2026 14:18:24 +0100
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D266A136469
	for <lists+linux-doc@lfdr.de>; Fri, 13 Feb 2026 14:18:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A146D307F493
	for <lists+linux-doc@lfdr.de>; Fri, 13 Feb 2026 13:17:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2742A3563FB;
	Fri, 13 Feb 2026 13:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sO4hRCIF"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0327C22126D;
	Fri, 13 Feb 2026 13:16:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770988620; cv=none; b=ZLYqIsPNZXiHBqsOZ3rcYe6l7qLrx0bs665SgnWMqw4AtMM9jxN7PFaJC0u/1BWf+7p2sUGI9HdAybhlo2zZcqSXJHdKlnEEbKhnDLYoAcvy/JIGJMMU6sSQi/gR2AL4rkYocT8+hp8Lhi860K0dAvI0oys8qqIpY4/i+KvIR2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770988620; c=relaxed/simple;
	bh=fAWQSackMQUnidJ8Lupx+2UA27XzP5St8/qRfXBVZvY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nz6QWMDTT9mB4flr426zdWkYSXOClYY6GjxKzcRNIA6H9Kz90ZSJEN4k7aryu/9Bo6QkvfHpmHp51gIO2FZ4R13XACdiX2NuL0QZ5wNNYENTmuOSkA0nTUEs9s5CsjtK7f4RcVGMFXUB0fyHbRqzlfaG+Uuad3GcZhiFfeim21Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sO4hRCIF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F239C116C6;
	Fri, 13 Feb 2026 13:16:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770988619;
	bh=fAWQSackMQUnidJ8Lupx+2UA27XzP5St8/qRfXBVZvY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sO4hRCIFiWVQAYB2SAEmk2S7tIGNwM2SZu7qMz0M0jfyB1Qq9Xp2DZ4SyHPNGL4Ym
	 MnF4RoYZBYeB7+lv4pu86K7WNJfvys9Asll2vKEyyRjsRgsEByMSYSuYgob7q5KdLd
	 UicWLrZmVbYWnvAab7eH0waN/ypooFuoN7tQguv8nJo0hFkYzF4xWeBcTm3qTOCme7
	 6S0zsl8uK3xPQEz7KUI22ImBiI9kr9av9jbSa5g61JrTlh0nrPjm+kSve1KkZnT314
	 JGe746l0FefPcWs2uwZnxFy+fRp0ntfADwm3h0B8HMIAVNGCf4etePGieAsD7shi5R
	 zjrOxXl5e408w==
Date: Fri, 13 Feb 2026 14:16:54 +0100
From: Niklas Cassel <cassel@kernel.org>
To: Aksh Garg <a-garg7@ti.com>
Cc: linux-pci@vger.kernel.org, linux-doc@vger.kernel.org,
	bhelgaas@google.com, corbet@lwn.net, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, s-vadapalli@ti.com,
	danishanwar@ti.com, srk@ti.com
Subject: Re: [RFC PATCH 0/4] PCI: Add DOE support for endpoint
Message-ID: <aY8kRu5ZYp44872D@fedora>
References: <20260213123603.420941-1-a-garg7@ti.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260213123603.420941-1-a-garg7@ti.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-75984-lists,linux-doc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[cassel@kernel.org,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D266A136469
X-Rspamd-Action: no action

Hello Aksh,

On Fri, Feb 13, 2026 at 06:05:59PM +0530, Aksh Garg wrote:

(snip)

>  create mode 100644 Documentation/PCI/pci-doe-ep.rst

I think it would make much more sense to create this file as:
Documentation/PCI/endpoint/pci-endpoint-doe.rst
(To match the existing naming scheme.)


>  create mode 100644 drivers/pci/doe-ep.c

I think it would make much more sense to create this file as:
drivers/pci/endpoint/pci-ep-doe.c
(To match the existing naming scheme.)


Kind regards,
Niklas

