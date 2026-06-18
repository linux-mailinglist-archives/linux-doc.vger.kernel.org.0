Return-Path: <linux-doc+bounces-92784-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id mCjGBUgeNGr3OwYAu9opvQ
	(envelope-from <linux-doc+bounces-92784-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Thu, 18 Jun 2026 18:35:20 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 75B836A19E9
	for <lists+linux-doc@lfdr.de>; Thu, 18 Jun 2026 18:35:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=G+hznsO4;
	spf=pass (mail.lfdr.de: domain of "linux-doc+bounces-92784-lists+linux-doc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-doc+bounces-92784-lists+linux-doc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 808A5302FEB4
	for <lists+linux-doc@lfdr.de>; Thu, 18 Jun 2026 16:35:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B23533115B8;
	Thu, 18 Jun 2026 16:35:17 +0000 (UTC)
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA2612EF66B;
	Thu, 18 Jun 2026 16:35:16 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781800517; cv=none; b=YkdhUVidYgQ1zYZHx7B5iNPcG7ITY3dW28TFkCyy/PCB9DDtUK3PRUCMkcsb7e0ER1KWV33KZ69XCvQJXwDrrFHKaIu4Y2vWPK2eruHZQWfKpUAqBFdfOiTimM+VjHbHObzC/W+LkjJaIhvZafbcWdy24nh3OddKivX1gI4HXJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781800517; c=relaxed/simple;
	bh=uD7ikKr5C1w3vb+FPbDvdVim6jqveophLD8eV2hDXBs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Tw+XX3Z2xzUdZHcKm6PXPyRW+pYbDlKWJTsFIEIQ8Iuq4Smpo/wZlWNorqTwoFKfvhgbhSoAzN8BhJV3wjluxTOFpHdytSSlZ4MvvV0AWYV7x3uA4AdRqxy5jy7eBz+rQQA9CaAs27VyblvAWRSPis9KADtDuDb0V2yLuXaQrBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G+hznsO4; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 675591F000E9;
	Thu, 18 Jun 2026 16:35:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781800516;
	bh=lsJMMWgRXJeP7sRFHXfktToOXcpEZ/f5CxFBiOSnxko=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=G+hznsO4NdzNl3Gkceu6+dMhQAy0qH9tUu+J2fyBDdk++OZthy7TmqQJaHnAHNACU
	 dl6/15d+E2QM4JRjhWdCmN3vQN+TCIsMoF2D3r2Y0HyinMkShHFJnNgyPjAVzSy5x2
	 Y6YZzLDRHAdWOmp2WdegRGeQjHb0cTBFiLUgH8XSkvG9lae/hepKATS20sjZEn4deM
	 vLTiupNLzUYrQE4/h9r/p3CXODGSEQxW7PIWPhZh+lGTadHTcweH7ZjsvcBq9eB6oV
	 TLy1qSJQQ4seD7ktCKN42S1pEV1l9Y7dIOAIfy/nIBHtGT+G+DI7OGBYs+TnrkEloe
	 rhn83wUnqctXw==
From: Pratyush Yadav <pratyush@kernel.org>
To: Pranjal Shrivastava <praan@google.com>
Cc: David Matlack <dmatlack@google.com>,  Pasha Tatashin
 <pasha.tatashin@soleen.com>,  Mike Rapoport <rppt@kernel.org>,
  kexec@lists.infradead.org,  linux-doc@vger.kernel.org,
  linux-kernel@vger.kernel.org,  linux-mm@kvack.org,
  linux-pci@vger.kernel.org,  Adithya Jayachandran
 <ajayachandra@nvidia.com>,  Alexander Graf <graf@amazon.com>,  Alex
 Williamson <alex@shazbot.org>,  Bjorn Helgaas <bhelgaas@google.com>,
  Chris Li <chrisl@kernel.org>,  David Rientjes <rientjes@google.com>,
  Jacob Pan <jacob.pan@linux.microsoft.com>,  Jason Gunthorpe
 <jgg@nvidia.com>,  Jonathan Corbet <corbet@lwn.net>,  Josh Hilke
 <jrhilke@google.com>,  Leon Romanovsky <leonro@nvidia.com>,  Lukas Wunner
 <lukas@wunner.de>,  Parav Pandit <parav@nvidia.com>,  Pratyush Yadav
 <pratyush@kernel.org>,  Saeed Mahameed <saeedm@nvidia.com>,  Samiullah
 Khawaja <skhawaja@google.com>,  Shuah Khan <skhan@linuxfoundation.org>,
  Vipin Sharma <vipinsh@google.com>,  William Tu <witu@nvidia.com>,  Yi Liu
 <yi.l.liu@intel.com>
Subject: Re: [PATCH v6 01/12] PCI: liveupdate: Set up FLB handler for the
 PCI core
In-Reply-To: <ajPzC2Xh1NMbfokP@google.com> (Pranjal Shrivastava's message of
	"Thu, 18 Jun 2026 13:30:51 +0000")
References: <20260522202410.3104264-1-dmatlack@google.com>
	<20260522202410.3104264-2-dmatlack@google.com>
	<178124130274.908199.14827357870284807134.b4-review@b4>
	<aiutNINqxhtlm2Dt@kernel.org>
	<178126123047.908199.12042730612990730743.b4-reply@b4>
	<ajB6V6yBHOjgK5ew@google.com> <ajPzC2Xh1NMbfokP@google.com>
Date: Thu, 18 Jun 2026 18:35:10 +0200
Message-ID: <2vxzv7bfolhd.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[29];
	FORGED_RECIPIENTS(0.00)[m:praan@google.com,m:dmatlack@google.com,m:pasha.tatashin@soleen.com,m:rppt@kernel.org,m:kexec@lists.infradead.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-mm@kvack.org,m:linux-pci@vger.kernel.org,m:ajayachandra@nvidia.com,m:graf@amazon.com,m:alex@shazbot.org,m:bhelgaas@google.com,m:chrisl@kernel.org,m:rientjes@google.com,m:jacob.pan@linux.microsoft.com,m:jgg@nvidia.com,m:corbet@lwn.net,m:jrhilke@google.com,m:leonro@nvidia.com,m:lukas@wunner.de,m:parav@nvidia.com,m:pratyush@kernel.org,m:saeedm@nvidia.com,m:skhawaja@google.com,m:skhan@linuxfoundation.org,m:vipinsh@google.com,m:witu@nvidia.com,m:yi.l.liu@intel.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[pratyush@kernel.org,linux-doc@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-92784-lists,linux-doc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pratyush@kernel.org,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-doc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 75B836A19E9

On Thu, Jun 18 2026, Pranjal Shrivastava wrote:

> On Mon, Jun 15, 2026 at 10:19:03PM +0000, David Matlack wrote:
>> On 2026-06-12 10:47 AM, Pasha Tatashin wrote:
>> > On 2026-06-12 09:54:44+03:00, Mike Rapoport wrote:
>> > > On Fri, Jun 12, 2026 at 05:15:02AM +0000, Pasha Tatashin wrote:
>> > > 
>> > > > On Fri, 22 May 2026 20:23:59 +0000, David Matlack <dmatlack@google.com> wrote:
>> > > > 
>> > > > Please add Pratyush, Mike, and myself so we are notified directly of 
>> > > > incoming patches, the same as with other areas where the liveupdate/ 
>> > > > tree is specified.
>> > > 
>> > > Or we can add PCI liveupdate files to LIVEUPDATE entry.
>> > 
>> > That will not work, as we cannot serve as maintainers for 
>> > PCI/VFIO/IOMMU/KVM, etc. David Matlack will be the maintainer for the 
>> > PCI components, and we will accept patches once they have been approved 
>> > by him.
>> > 
>> > The simplification we could do is to create an email alias 
>> > for the live-update tree maintainers. This would allow us to use a 
>> > single entry instead of listing all three of us individually.
>> 
>> We could create a Live Update mailing list for all code that can be CCed
>> on all patches that must be merged through the Live Update tree. I would
>> also be interested in subscribing to that list.
>
> +1. I'd like if there's a specific Live Update mailing list for
> submissions & discussion about the Live Update tree.

We treat kexec@lists.infradead.org as the "live update mailing list". We
considered getting a separate one, but I reckon the traffic is low
enough on kexec@ already that we can re-use it for live update.

So perhaps we just Cc kexec@? Is there anything to be gained by creating
an alias?

-- 
Regards,
Pratyush Yadav

