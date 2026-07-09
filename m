Return-Path: <linux-doc+bounces-96130-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id gjdAFsojUGqGuAIAu9opvQ
	(envelope-from <linux-doc+bounces-96130-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 10 Jul 2026 00:42:18 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CC4C97361C0
	for <lists+linux-doc@lfdr.de>; Fri, 10 Jul 2026 00:42:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=ifBPq5OZ;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-96130-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-96130-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6C68F300F5D2
	for <lists+linux-doc@lfdr.de>; Thu,  9 Jul 2026 22:42:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5332E339853;
	Thu,  9 Jul 2026 22:42:09 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4799B1A9FA8;
	Thu,  9 Jul 2026 22:42:08 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783636929; cv=none; b=Sb88Nlcj2ARHjUYgNevhyN3KwNgNjwmZWSPVNrXUy44vHV58aqiNxqYoG14HHxCEhMwWHC/ExvPs5xOC5JTyKY1s2KO51S4dzDJ2j0G1t5zFmIKwQYszDZv0vK+PjrOnjejke6UPH1Me7MKHVB+820acuWgeoYlk1IUlWuty5LA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783636929; c=relaxed/simple;
	bh=wwOiS1jTfv0k2cDudKThF1veiYSwYrxs8097wzSvwCE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=qATJzoBmLu3c3FTOavKyaxAbn70cRwtdmP1gRCEbDVIFT6AHOecTnZC45juj2UsxOPtX49SWOb2VqmujYeSmVu317Qx2V3odaz3k3Wba/k9Rmg+rM21H+SVBTd5ae0sOJYf0RSmw/f7IsXHGHXhJm2i9PSUzoN05LKp2/x8mr2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ifBPq5OZ; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B59D31F000E9;
	Thu,  9 Jul 2026 22:42:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783636927;
	bh=kZqBV0h2Ysco3x+okR7LyFcVjz1JoLkubJmF60s4PQE=;
	h=Date:From:To:Cc:Subject:In-Reply-To;
	b=ifBPq5OZNsfvHF4IGu8LuJGf83QUd79cM+cHTY1CR8Batd5orrPwwwF192hm8OKYd
	 mxS+g9rw5lKu1fwymJvdYXcpS0GJZtCUTIsa90eKNL6yhKyeG7IUbYyUgYsBCQa4Q8
	 RiMZM3j79jIPsd1tShNZnh6bk39zsjzNIFKQRSI4i0b10/rigC/GgUoYdEr1waLIwg
	 310VZDFIzWu/ML0A0K9i1SO2wDqQKO04VY7I8lFkM0XHE+uEXmMeAwQbM4pQr0qn7h
	 PcPOtcSFV0xN9v/Nzi3T8ucFtkNPxsc0YPsxXLIr7qPxx9nItyfpLpCCimXOdKkNIh
	 O9b2sLNqsJbwQ==
Date: Thu, 9 Jul 2026 17:42:06 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Yury Murashka <yurypm@arista.com>
Cc: bhelgaas@google.com, corbet@lwn.net, skhan@linuxfoundation.org,
	mahesh@linux.ibm.com, oohall@gmail.com, linux-pci@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v2 0/2] PCI: Add boot options to disable DPC and AER
 recovery
Message-ID: <20260709224206.GA913007@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260709185429.627968-1-yurypm@arista.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96130-lists,linux-doc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:yurypm@arista.com,m:bhelgaas@google.com,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:mahesh@linux.ibm.com,m:oohall@gmail.com,m:linux-pci@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,s:lists@lfdr.de];
	FREEMAIL_CC(0.00)[google.com,lwn.net,linuxfoundation.org,linux.ibm.com,gmail.com,vger.kernel.org,lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[helgaas@kernel.org,linux-doc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[helgaas@kernel.org,linux-doc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[linux-doc];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CC4C97361C0

On Thu, Jul 09, 2026 at 06:54:27PM +0000, Yury Murashka wrote:
> On large modular systems with a complex PCIe tree, the default kernel
> AER recovery and DPC behavior could cause unexpected side effects.

I can't tell what the actual issues are, but if there are kernel
defects in this area, we should fix them.  If this is to work around
platform defects, maybe we need quirks to work around them
automatically?

