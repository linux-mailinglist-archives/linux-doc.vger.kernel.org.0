Return-Path: <linux-doc+bounces-84002-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6HjzMmeI52kU9wEAu9opvQ
	(envelope-from <linux-doc+bounces-84002-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Tue, 21 Apr 2026 16:23:35 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6571943BF5C
	for <lists+linux-doc@lfdr.de>; Tue, 21 Apr 2026 16:23:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2EAFA3076163
	for <lists+linux-doc@lfdr.de>; Tue, 21 Apr 2026 14:18:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EF4D3D813B;
	Tue, 21 Apr 2026 14:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="DU2TyQmQ"
X-Original-To: linux-doc@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1CA63CF67C;
	Tue, 21 Apr 2026 14:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776781122; cv=none; b=V/QjWfIemoUtkTAcZnJx1zyT3/eAApCFpzjszDAKLOgv5r/7S0HVV0BcrFLo9zc2xRR3MmesX85drr08ghYf9Y/MFph7eKP34kKEcHzRTX52j+Z/nyHSQSoPUfxoTLBRePmWm5nmvoiRcuzdAmLaPb4bDLr29nESQrb3Kpx7SsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776781122; c=relaxed/simple;
	bh=vAu2TZe4KLTTnExsF79HZ16TqzLObTuSThMNMoqwYmo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Disposition; b=UFVGTarzdiHyfATXjO4+MKCw4HsgrTMkSpvBM7c9q2KzVr4lMXb6qST1a/FTLT9G+qXTVZWfDEW267oRwtje5anM2RrD6dCsI/Tar9ISezLa7TI6B8FVICnLYd9HYEjN6GVXyiA1YmiTBRX5zGQJPczTmTwjGn4PpM0XPkc71Cc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=DU2TyQmQ; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C0D1825DC;
	Tue, 21 Apr 2026 07:18:34 -0700 (PDT)
Received: from devkitleo.cambridge.arm.com (devkitleo.cambridge.arm.com [10.1.196.90])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 28ACA3F915;
	Tue, 21 Apr 2026 07:18:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776781120; bh=vAu2TZe4KLTTnExsF79HZ16TqzLObTuSThMNMoqwYmo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DU2TyQmQAdeK7LaY99ERkB/P2rD92ghDuIBKbHU6l8oH8aVSyeuqUaXTzQZZME4pS
	 3Cma8C6BrCfnkUqZx1mWuRt1mElr+RuJm0OJoKWjz0NS+id2zVAQUoRqox3MEZXy2j
	 +eYt99Ev0UEajRaFBOa6mkGWCp0dShOF6OHK89AU=
From: Leonardo Bras <leo.bras@arm.com>
To: Tian Zheng <zhengtian10@huawei.com>
Cc: Leonardo Bras <leo.bras@arm.com>,
	maz@kernel.org,
	oupton@kernel.org,
	catalin.marinas@arm.com,
	corbet@lwn.net,
	pbonzini@redhat.com,
	will@kernel.org,
	yuzenghui@huawei.com,
	wangzhou1@hisilicon.com,
	liuyonglong@huawei.com,
	Jonathan.Cameron@huawei.com,
	yezhenyu2@huawei.com,
	linuxarm@huawei.com,
	joey.gouly@arm.com,
	kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	suzuki.poulose@arm.com
Subject: Re: [PATCH v3 4/5] KVM: arm64: Enable HDBSS support and handle HDBSSF events
Date: Tue, 21 Apr 2026 15:18:28 +0100
Message-ID: <aeeHNMqDx5Yipt_K@devkitleo>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <acpfD3YjMpEdL5KZ@devkitleo>
References: <20260225040421.2683931-1-zhengtian10@huawei.com> <20260225040421.2683931-5-zhengtian10@huawei.com> <acQj5grOdZT8LUGp@devkitleo> <e3253959-0340-4c13-a980-a599e090a6de@huawei.com> <acabezCO4B5BE40Q@devkitleo> <4e800c1e-25db-4aa2-b100-63434973de93@huawei.com> <acpfD3YjMpEdL5KZ@devkitleo>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[arm.com:s=foss];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[arm.com:+];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-84002-lists,linux-doc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[leo.bras@arm.com,linux-doc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-doc];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 6571943BF5C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 30, 2026 at 12:31:28PM +0100, Leonardo Bras wrote:
> On Sat, Mar 28, 2026 at 02:05:25PM +0800, Tian Zheng wrote:
> > 
> > On 3/27/2026 11:00 PM, Leonardo Bras wrote:
> > > On Fri, Mar 27, 2026 at 03:35:29PM +0800, Tian Zheng wrote:
> > > > On 3/26/2026 2:05 AM, Leonardo Bras wrote:
> > > > > Hello Tian,
> > > > > 
> > > > > I am currently working on HACDBS enablement(which will be rebased on top of
> > > > > this patchset) and due to the fact HACDBS and HDBSS are kind of
> > > > > complementary I will sometimes come with some questions for issues I have
> > > > > faced myself on that part. :)
> > > > > 
> > > > > (see below)
> > > > 
> > > > Of course! Happy to exchange ideas and learn together.
> > > :)

Hello Tian,

On the above, HACDBS depends on HACDBSIRQ which can be announced by either 
device-tree or ACPI. 

Do you think it's ok for it to be ACPI only, for now?

Thanks!
Leo

