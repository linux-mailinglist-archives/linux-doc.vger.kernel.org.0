Return-Path: <linux-doc+bounces-94576-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id iC09AT9QRmo6QgsAu9opvQ
	(envelope-from <linux-doc+bounces-94576-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 02 Jul 2026 13:49:19 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 600506F7012
	for <lists+linux-doc@lfdr.de>; Thu, 02 Jul 2026 13:49:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=XUbn8wYj;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-94576-lists+linux-doc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-doc+bounces-94576-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 21E00308EBB2
	for <lists+linux-doc@lfdr.de>; Thu,  2 Jul 2026 11:32:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A0124189DA;
	Thu,  2 Jul 2026 11:32:07 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 349693D813A
	for <linux-doc@vger.kernel.org>; Thu,  2 Jul 2026 11:32:06 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782991927; cv=none; b=Js+Ij+8A+zNpgJJa/bmuz+pGsahIfWekV/ehypRqogCOKKePbltR1aifQ+/V/TcJVzq1ik8mMhxlh0ho2h1+aFVQ+5k8SP6YdJ9pBtK+24ng6KrM+/pHtGbmfpTlmClEpvzKQyG0FEspBBQWFzSBgloHAk+8Ae7DzJzOQBlxyoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782991927; c=relaxed/simple;
	bh=TxQCtqjtAk2iQqQD7O6uKHlwflcfM75/SGEiXcjbbI0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bVPcwBt/r7gK0cEPJnUhInzcX31y4FZsLqHaV0v7d83J9Fegi0q9WHOjiwt1tKc+jmdL2l8WwC6tlzyAm2XNLDBhD2LOkm4RNqPyiV4RL8xFmCD7i2ztxiCsvSsshI2PGGKP5ug4MtKMVgXiwTmfSFtIV+5cm5glD1dazXgWyjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XUbn8wYj; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBEF51F00A3E
	for <linux-doc@vger.kernel.org>; Thu,  2 Jul 2026 11:32:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782991925;
	bh=TxQCtqjtAk2iQqQD7O6uKHlwflcfM75/SGEiXcjbbI0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=XUbn8wYjcbFq3YuGEIAkjj+cxW3RoKyHvCBLm7FrowkVoQWmsezKMFntmVRriW0Dv
	 Bmn3JOAf0ClmyXsdxe3ZYXNQfFGE9gVQx8N38QQzEvmwOSUoMrR1hVtw+4lgyLMjv9
	 7LAWIaWtgGDMZnnMlJZJJ0tVAR6wh2fmQelm7x/QFwtBuxUHoxnq9Zvn0ROTNLV02z
	 3yvqDPAN/YLi4tHC8aZ6+DN/RSpyl/0eLXv7DjJa7lAvMU3FaUXJkJWxF2pf6GaUIX
	 6w/+t1kyHfcJ0hHuRCaNOvk6Frr1GRRiKzIIAC8up5IXaAYlRGr6Xv9nnj7E8MOIVb
	 FPyjOZFGbgpgA==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5aeb98460c6so1552243e87.2
        for <linux-doc@vger.kernel.org>; Thu, 02 Jul 2026 04:32:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqD6etuC0nTaCXO3e89SBKXuSwZCgjsRrrXGuf4Zk/qjFfOx1CjVyEyqpw5HRyVVSIVHCooxQegSs4=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywbw6EpHg+tb3NWStREe7BeG9DFFpKKvizKONfY6LcJ6T5V5o7P
	HBX4JwK5AecxeN79n9F/0qC+u3TTGU1aIGkq2w0R6QcHTAcwF67fmKtZpWBe+peZF0EKc5nJdjw
	SYRr7Zgmm+9DTbmcbFOqvT0bSkmwPut8=
X-Received: by 2002:a05:6512:2511:b0:5ae:ba92:f43b with SMTP id
 2adb3069b0e04-5aec80689d2mr1445491e87.52.1782991924360; Thu, 02 Jul 2026
 04:32:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <6027395.DvuYhMxLoT@rafael.j.wysocki> <akYsRl024Ll80oye@ashevche-desk.local>
In-Reply-To: <akYsRl024Ll80oye@ashevche-desk.local>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Thu, 2 Jul 2026 13:31:50 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0hszyrY+GLz0Q1HcNgMua056xuw8Uxf_O63OmyObPtkXw@mail.gmail.com>
X-Gm-Features: AVVi8CcB1CehQxSaZBKpjLXdEZ66xS6KSnQB6qAqVEVmAqLCZyXITmn8Rg4ltiQ
Message-ID: <CAJZ5v0hszyrY+GLz0Q1HcNgMua056xuw8Uxf_O63OmyObPtkXw@mail.gmail.com>
Subject: Re: [PATCH v1 0/2] ACPI: bus: Remove struct acpi_driver from the kernel
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>, Linux ACPI <linux-acpi@vger.kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Hans de Goede <hansg@kernel.org>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	LKML <linux-kernel@vger.kernel.org>, 
	Linux Documentation <linux-doc@vger.kernel.org>, driver-core@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94576-lists,linux-doc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:andriy.shevchenko@linux.intel.com,m:rafael@kernel.org,m:linux-acpi@vger.kernel.org,m:dakr@kernel.org,m:gregkh@linuxfoundation.org,m:hansg@kernel.org,m:ilpo.jarvinen@linux.intel.com,m:linux-kernel@vger.kernel.org,m:linux-doc@vger.kernel.org,m:driver-core@lists.linux.dev,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[rafael@kernel.org,linux-doc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rafael@kernel.org,linux-doc@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,mail.gmail.com:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,intel.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 600506F7012

On Thu, Jul 2, 2026 at 11:15=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Wed, Jul 01, 2026 at 09:15:27PM +0200, Rafael J. Wysocki (Intel) wrote=
:
> > Hi All,
> >
> > After converting all of the drivers using the struct acpi_driver interf=
ace to
> > proper platform drivers, that interface can be dropped now, which is do=
ne in
> > this series (patch [1/2]).
>
> What a nice result!
>
> > Additionally, the no_pm flag is set for all struct acpi_device object s=
ince
> > they are not going to be directly involved in any kind of power managem=
ent
> > now (that is, they will not have PM-aware drivers and they will not be
> > included in PM domains).
>
> I am in favour of this cleanup!
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Thank you!

