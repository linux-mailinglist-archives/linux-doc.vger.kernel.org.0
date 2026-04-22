Return-Path: <linux-doc+bounces-84150-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IPc+LFKr6GnEOQIAu9opvQ
	(envelope-from <linux-doc+bounces-84150-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 22 Apr 2026 13:04:50 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id B2C6E44518B
	for <lists+linux-doc@lfdr.de>; Wed, 22 Apr 2026 13:04:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3B36630106BD
	for <lists+linux-doc@lfdr.de>; Wed, 22 Apr 2026 10:56:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 131743C3C03;
	Wed, 22 Apr 2026 10:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codethink.co.uk header.i=@codethink.co.uk header.b="CIUGRtxO"
X-Original-To: linux-doc@vger.kernel.org
Received: from imap4.hz.codethink.co.uk (imap4.hz.codethink.co.uk [188.40.203.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AE923542E5
	for <linux-doc@vger.kernel.org>; Wed, 22 Apr 2026 10:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.203.114
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776855418; cv=none; b=ETUVzse5t108aEtGJq8XwYmfAdeUwonOPLPRbYI+b4Mbo6AFX8bk/d2sICfSxUWv8r+CJxTFck1wTWFZfkYqOP32fTvrv+eeg2uHFvNfdsDTuzLjBlVe6rzM/Kz2koaf7Z/lJ8Q1zYF8Zl8RBDAqGorQb9+IVChzEEXQaJaqSeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776855418; c=relaxed/simple;
	bh=NeTOuANkhILj/td45DFPdp3bc112EYJucS9kkaR9sA4=;
	h=Date:Message-ID:Cc:Subject:MIME-Version:Content-Type:From:To:
	 MIME-Version:Content-Type; b=YClwI/wcH/ul6VcaNhf+IJHDnXIckprjXMFosQSE1rSCVevFjvMLkX5aojK1yFRILv6bAUZtj86qu8UoMg5w3u/2w7yXewH3eUrJXcjSzjO0+JA8KNlRpYqB3HVudZPZlX4MHkXAX1EpdZgfeICmkyWAFbVxk0jh2FsLzzaD07g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=codethink.co.uk; spf=pass smtp.mailfrom=codethink.co.uk; dkim=pass (2048-bit key) header.d=codethink.co.uk header.i=@codethink.co.uk header.b=CIUGRtxO; arc=none smtp.client-ip=188.40.203.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=codethink.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codethink.co.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=codethink.co.uk; s=imap4-20230908; h=Sender:Content-Transfer-Encoding:
	MIME-Version:To:From:Subject:Cc:Message-ID:Date:Reply-To:In-Reply-To:
	References; bh=NeTOuANkhILj/td45DFPdp3bc112EYJucS9kkaR9sA4=; b=CIUGRtxO4WJZTc
	HWaLbyPmw9CEmXDXTPaOGiaM8aQhN/AgXff+VZ5k+AT7r4ybpwBQlLZHEiJcu9SRPNSyLTxs2WS9e
	nLhFzo07xkrQUWLK7cpGoR0oJcxO7ejrGR1e/6I7ujbjPDiVRRCq34l0+BPTQydqS1WjEByHj141z
	PQ+qVrWh8xxGr/Izq+i9O/vbDonlXMSTThc5YNb4EBBAvI4CAFgNdyUvRUVSaEwTHYkh0j92Eoxa7
	oqxnzu9wXxp3Nvi89v0no0t8mBoER96JyFYatTxsFfR/2tPUVzZQvIKoJtyoIiJisDq/PGmrK5FKI
	nKnDZHMh3tcPrfidCv6A==;
Received: from [109.54.146.98] (helo=localhost)
	by imap4.hz.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1wFUvP-0090eg-8K; Wed, 22 Apr 2026 11:35:19 +0100
Date: Wed, 22 Apr 2026 12:35:18 +0200
Message-ID: <403330813c60b650873c54c68042e066@codethink.co.uk>
Content-Transfer-Encoding: 8bit
Cc: Matteo Martelli <matteo.martelli@codethink.co.uk>, Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org
Subject: docs: Stale website link in trace/rv/monitor_sched.rst
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
From: Matteo Martelli <matteo.martelli@codethink.co.uk>
To: Jonathan Corbet <corbet@lwn.net>, Gabriele Monaco <gmonaco@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Sender: matteo.martelli@codethink.co.uk
X-Spamd-Result: default: False [4.84 / 15.00];
	MULTIPLE_UNIQUE_HEADERS(7.00)[Content-Transfer-Encoding,Content-Type];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[codethink.co.uk,reject];
	R_DKIM_ALLOW(-0.20)[codethink.co.uk:s=imap4-20230908];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-84150-lists,linux-doc=lfdr.de];
	GREYLIST(0.00)[pass,body];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.883];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[matteo.martelli@codethink.co.uk,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[codethink.co.uk:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	RCPT_COUNT_FIVE(0.00)[5];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,codethink.co.uk:dkim,codethink.co.uk:mid]
X-Rspamd-Queue-Id: B2C6E44518B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


Hi all,

I came across the Documentation/trace/rv/monitor_sched.rst document and found
out that the link under references is stale as it points to what looks like a
scam website.

The link was added in [1] together with the first version of the document.

I'm just reporting without a patch as I don't know what the new link should be.

[1]: https://lore.kernel.org/all/20250305140406.350227-9-gmonaco@redhat.com/

Best regards,
Matteo Martelli

