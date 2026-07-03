Return-Path: <linux-doc+bounces-94904-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Y5cUNdQeSGo2mgAAu9opvQ
	(envelope-from <linux-doc+bounces-94904-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Fri, 03 Jul 2026 22:43:00 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2880F705910
	for <lists+linux-doc@lfdr.de>; Fri, 03 Jul 2026 22:43:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=V6+ceFAM;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-94904-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-94904-lists+linux-doc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A29093009B39
	for <lists+linux-doc@lfdr.de>; Fri,  3 Jul 2026 20:37:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC1C6352031;
	Fri,  3 Jul 2026 20:37:34 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD7782F7EE0;
	Fri,  3 Jul 2026 20:37:33 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783111054; cv=none; b=B84pk0O95BAKXYyIsCRtU0X338xVf+VKM24saJ9D7U87q8IO6AnNHQ9X9pa+9rW/oMak+6lVMMeMjzCnfcdXamTquigRw9LrPEH1zyOfRYtr8YUqbsHOzItDByNERpgMP76LDe+6Fs4TLODb8+1pPl+kqdvmYHVd/iVQMK1P2BQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783111054; c=relaxed/simple;
	bh=GcriZEc4U0XXe7dXq2fvsZPm3rKmmAhSx/ItBsf5aK4=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Subject:Cc:To:
	 References:In-Reply-To; b=RyiYxhNRnGSlr0SLsPayEQIvCQkELhciQtM34aQM9GvvW4HuyP6/aboiWiZZFQCOO30Yg4pc7iYaCG0SmTAFFXDQRPM/xtw/C1O7Oax09O03DRYa20sb2t/F+HQvChYSWr1njPna4dkk1nZWu3L5QyRiJtL+ynRmkw/dQWWUXzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V6+ceFAM; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5DBC1F000E9;
	Fri,  3 Jul 2026 20:37:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783111053;
	bh=i//NHTkbfprJa6ZWAaOnkiICtSIwQ8o4UKQkkx8svt0=;
	h=Date:From:Subject:Cc:To:References:In-Reply-To;
	b=V6+ceFAMTfg20u/FFhrV1wNN5T/acbnPfh+cBr/9QVbQC2/7HwAMK9Lr4opvb8HRJ
	 avvPgWn+SXUqvGHLgx3X5FyQ3MS/vUFReOzi8jL9toVQctdZGRKUrt6PW27ap/dBiq
	 tygpRfwZKH2D7wyKdoe29NE0ah8Yl7CQR+hUoNiBVTHAuk3aEo9q6hS0xhPNvxm/1r
	 qqy57phw77CLJQIXWWWLwdoaRRKQRq5x+GoLVb/r6BbmnP2DUilr6kppwUEnd8RO6C
	 vcZ7c73VBRt2kcQNDkIDL7aUgjGtni6JlHVsKf9KTdky3qEpHxFLZa4rRxBSRZcfTW
	 SqGKIHm6TOejw==
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 03 Jul 2026 22:37:30 +0200
Message-Id: <DJP8443BNCPE.D67486LKL0E2@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v1 2/2] ACPI: scan: Set power.no_pm for all struct
 acpi_device objects
Cc: "Linux ACPI" <linux-acpi@vger.kernel.org>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Hans de Goede" <hansg@kernel.org>,
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, "LKML"
 <linux-kernel@vger.kernel.org>, "Linux Documentation"
 <linux-doc@vger.kernel.org>, "Andy Shevchenko"
 <andriy.shevchenko@linux.intel.com>, <driver-core@lists.linux.dev>
To: "Rafael J.  Wysocki" <rafael@kernel.org>
References: <6027395.DvuYhMxLoT@rafael.j.wysocki>
 <2436882.ElGaqSPkdT@rafael.j.wysocki>
In-Reply-To: <2436882.ElGaqSPkdT@rafael.j.wysocki>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94904-lists,linux-doc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[dakr@kernel.org,linux-doc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:linux-acpi@vger.kernel.org,m:gregkh@linuxfoundation.org,m:hansg@kernel.org,m:ilpo.jarvinen@linux.intel.com,m:linux-kernel@vger.kernel.org,m:linux-doc@vger.kernel.org,m:andriy.shevchenko@linux.intel.com,m:driver-core@lists.linux.dev,m:rafael@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dakr@kernel.org,linux-doc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[linux-doc];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:email,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2880F705910

On Wed Jul 1, 2026 at 9:17 PM CEST, Rafael J.  Wysocki wrote:
> From: "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
>
> Now that drivers do not bind to ACPI device objects, there is no reason
> for them to be included directly in power management in any way, so set
> power.no_pm for all of them.
>
> Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

Reviewed-by: Danilo Krummrich <dakr@kernel.org>

