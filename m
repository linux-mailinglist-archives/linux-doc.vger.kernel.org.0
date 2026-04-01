Return-Path: <linux-doc+bounces-82078-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iAPjJ/IvzWn0agYAu9opvQ
	(envelope-from <linux-doc+bounces-82078-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 01 Apr 2026 16:47:14 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 615C637C692
	for <lists+linux-doc@lfdr.de>; Wed, 01 Apr 2026 16:47:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 97189301F49E
	for <lists+linux-doc@lfdr.de>; Wed,  1 Apr 2026 14:36:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C72D30FF36;
	Wed,  1 Apr 2026 14:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Mh1uVFU6"
X-Original-To: linux-doc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7829B305E1F;
	Wed,  1 Apr 2026 14:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775054214; cv=none; b=QMAt5QNzR8YQk8briqpe5awsjvQbGO0Mts8m6XOwIgpO0jwnV4ZbCCigmf2ML42YdFEf8ZG3TFeHx/+7ia88k3xJeDMtXZvbUAMM+brBHQa+WUwCpW1jrsUOwK8wSwvlxVWrukgb7x6A5q480PLwRs1+TROw5XTZx84+pxFlj18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775054214; c=relaxed/simple;
	bh=RihWe9fQIxmIgwDhwcNSbhkpSL03nKNn1qbJPB0J2+U=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=hieG0fJpUJB9tY/pUXKmGz52bbO6BuM2igjOy2DRJEmg+60SRPPm/kb51DMv8H7Sgy4sC0bb/FUldXLVv4gkdJZykctg+4Y6Q+ecBWE9h9ipk8OO7qySs2BY17h27JRcZ1PJM7nrbx3ZOfbpFzpyX8nrgHGWhHeQaeVS8B6xKI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Mh1uVFU6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CA7AC4CEF7;
	Wed,  1 Apr 2026 14:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775054214;
	bh=RihWe9fQIxmIgwDhwcNSbhkpSL03nKNn1qbJPB0J2+U=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Mh1uVFU6JNai1F9LdjWZbPPl7KJBJc8d/UReYXUGnDCRuxJaxSzbVyb7uI1yVk0eY
	 z4tCaC1+/jcFn4w7FOqjQ5BcWgrcLvdBZQzSVhYpDx26G+zrVLqFu14gCt8nS+Vi5h
	 Ifn3lWC0ydfzvZHrDwRLhJVy/vnguhYMQZ6l43sez2ujouO57nd14+jJqIsNMuLjTZ
	 qsftSArXs+pzZFPBoUFoOUWsuqKUAjQ/4tInVAjNM80oBXZLDQZQZZu14Wg+LXTNBF
	 ChHo0rv201AbzjEGvwdUL3WGHrR1zPBnYNTp0o7SujROuhxgfybL+8NoXMIyzSXYsG
	 8x5XQRwJKsnHA==
From: Pratyush Yadav <pratyush@kernel.org>
To: David Matlack <dmatlack@google.com>
Cc: Alex Williamson <alex@shazbot.org>,  Adithya Jayachandran
 <ajayachandra@nvidia.com>,  Alexander Graf <graf@amazon.com>,  Alex Mastro
 <amastro@fb.com>,  Alistair Popple <apopple@nvidia.com>,  Andrew Morton
 <akpm@linux-foundation.org>,  Ankit Agrawal <ankita@nvidia.com>,  Bjorn
 Helgaas <bhelgaas@google.com>,  Chris Li <chrisl@kernel.org>,  David
 Rientjes <rientjes@google.com>,  Jacob Pan
 <jacob.pan@linux.microsoft.com>,  Jason Gunthorpe <jgg@nvidia.com>,  Jason
 Gunthorpe <jgg@ziepe.ca>,  Jonathan Corbet <corbet@lwn.net>,  Josh Hilke
 <jrhilke@google.com>,  Kevin Tian <kevin.tian@intel.com>,
  kexec@lists.infradead.org,  kvm@vger.kernel.org,  Leon Romanovsky
 <leon@kernel.org>,  Leon Romanovsky <leonro@nvidia.com>,
  linux-doc@vger.kernel.org,  linux-kernel@vger.kernel.org,
  linux-kselftest@vger.kernel.org,  linux-mm@kvack.org,
  linux-pci@vger.kernel.org,  Lukas Wunner <lukas@wunner.de>,  =?utf-8?Q?M?=
 =?utf-8?Q?icha=C5=82?=
 Winiarski <michal.winiarski@intel.com>,  Mike Rapoport <rppt@kernel.org>,
  Parav Pandit <parav@nvidia.com>,  Pasha Tatashin
 <pasha.tatashin@soleen.com>,  Pranjal Shrivastava <praan@google.com>,
  Pratyush Yadav <pratyush@kernel.org>,  Raghavendra Rao Ananta
 <rananta@google.com>,  Rodrigo Vivi <rodrigo.vivi@intel.com>,  Saeed
 Mahameed <saeedm@nvidia.com>,  Samiullah Khawaja <skhawaja@google.com>,
  Shuah Khan <skhan@linuxfoundation.org>,  Thomas =?utf-8?Q?Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>,  Tomita Moeko <tomitamoeko@gmail.com>,
  Vipin Sharma <vipinsh@google.com>,  Vivek Kasireddy
 <vivek.kasireddy@intel.com>,  William Tu <witu@nvidia.com>,  Yi Liu
 <yi.l.liu@intel.com>,  Zhu Yanjun <yanjun.zhu@linux.dev>
Subject: Re: [PATCH v2 06/22] vfio/pci: Retrieve preserved device files
 after Live Update
In-Reply-To: <aaDZ-ffs4kiUo3GY@google.com> (David Matlack's message of "Thu,
	26 Feb 2026 23:40:41 +0000")
References: <20260129212510.967611-1-dmatlack@google.com>
	<20260129212510.967611-7-dmatlack@google.com>
	<20260226155222.5452a741@shazbot.org> <aaDZ-ffs4kiUo3GY@google.com>
Date: Wed, 01 Apr 2026 14:36:44 +0000
Message-ID: <2vxzjyuqhhmr.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-82078-lists,linux-doc=lfdr.de];
	FREEMAIL_CC(0.00)[shazbot.org,nvidia.com,amazon.com,fb.com,linux-foundation.org,google.com,kernel.org,linux.microsoft.com,ziepe.ca,lwn.net,intel.com,lists.infradead.org,vger.kernel.org,kvack.org,wunner.de,soleen.com,linuxfoundation.org,linux.intel.com,gmail.com,linux.dev];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[45];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pratyush@kernel.org,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-doc];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 615C637C692
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Feb 26 2026, David Matlack wrote:

> On 2026-02-26 03:52 PM, Alex Williamson wrote:
>> On Thu, 29 Jan 2026 21:24:53 +0000 David Matlack <dmatlack@google.com> wrote:
>
>> > diff --git a/drivers/vfio/device_cdev.c b/drivers/vfio/device_cdev.c
>> > index 8ceca24ac136..935f84a35875 100644
>> > --- a/drivers/vfio/device_cdev.c
>> > +++ b/drivers/vfio/device_cdev.c
>> > @@ -52,6 +46,19 @@ int vfio_device_fops_cdev_open(struct inode *inode, struct file *filep)
>> >  	vfio_device_put_registration(device);
>> >  	return ret;
>> >  }
>> > +EXPORT_SYMBOL_GPL(__vfio_device_fops_cdev_open);
>> 
>> I really dislike that we're exporting the underscore variant, which
>> implies it's an internal function that the caller should understand the
>> constraints, without outlining any constraints.
>> 
>> I'm not sure what a good alternative is.  We can drop fops since this
>> isn't called from file_operations.  Maybe vfio_device_cdev_open_file().
>
> Ack. Due to the bug you pointed out below, I think the changes in this
> file will look fairly different in the next version. But no matter what
> I'll avoid exporting a underscore variant without outlining the
> constraints.

I haven't yet had a chance to read v3 so maybe you already solved this
problem. But I dealt with some similar problems for the memfd patches
[0] and the hugetlb patches [1]. What I did was to just use/add a
internal header (mm/internal.h or mm/hugetlb_internal.h). This lets you
share functions within your subsystem but avoid exporting everywhere
else.

I see that there already is drivers/vfio/vfio.h so perhaps you can use
that to avoid exporting these functions outside the subsystem?

[0] https://git.kernel.org/torvalds/c/ed6f45f81bf9
[1] https://lore.kernel.org/linux-mm/20251206230222.853493-6-pratyush@kernel.org/

[...]

-- 
Regards,
Pratyush Yadav

