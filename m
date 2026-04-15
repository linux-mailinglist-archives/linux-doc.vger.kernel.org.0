Return-Path: <linux-doc+bounces-83514-lists+linux-doc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-doc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MNtSLjCw32lCXwAAu9opvQ
	(envelope-from <linux-doc+bounces-83514-lists+linux-doc=lfdr.de@vger.kernel.org>)
	for <lists+linux-doc@lfdr.de>; Wed, 15 Apr 2026 17:35:12 +0200
X-Original-To: lists+linux-doc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A947405FC2
	for <lists+linux-doc@lfdr.de>; Wed, 15 Apr 2026 17:35:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7E3C330214D7
	for <lists+linux-doc@lfdr.de>; Wed, 15 Apr 2026 15:33:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C4A23DEAFF;
	Wed, 15 Apr 2026 15:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="F75dbddm"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A77A3DDDDD
	for <linux-doc@vger.kernel.org>; Wed, 15 Apr 2026 15:32:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776267178; cv=none; b=Ak/364urmPXaDIFB3aBOyocgkt+aQwWZlXa/9JuiDUaeMeSWykxeuFs4MF1lj+9G9MEWXnvfTrRto+TTPPQtUEUnp24SG//VND1XhbefW6I9tnTMaebHLd+gSqk/Gz2nD9Gi/i6adugJcH6iLidFEeBC49SsvOhLrKCiELbZ6pU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776267178; c=relaxed/simple;
	bh=S9dcy47a6bd3TjyPD9yCkf196y5TA2ypeoVg+NZ5el8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nLZdLsOCi6MSAbi8BWQ64U8A6L+hbDTtpGX4hf++MJV0EZcH7xe8inJVa1TzkWjAkqng0bIpzG+svwFL0Yiz/jjEWCzSqXQmk27F3b+RjhGJ/h+FmGN7/1xOwTU2Tphph4aTqNuBbFso/eolWyGp3XwuHYIqTwsMkC+9e+hD6II=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=F75dbddm; arc=none smtp.client-ip=74.125.224.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-6501d32b04bso6562612d50.2
        for <linux-doc@vger.kernel.org>; Wed, 15 Apr 2026 08:32:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1776267172; x=1776871972; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=e5e7YwNWCtbTE/x5+I5oKOHLYRavpYy019TGcszzWak=;
        b=F75dbddmtN8OwVFOGaZDhKK+Hwp3WWuk6vEYx4MlQTcEs+tFqsdTq57ybk+HLuWF8C
         C6OwnvIApNdSIYMiehBPnT/3ZTurGwkLIlxJk5YEIH/y+CwjQosV+dZxCz34E3TusL6E
         ERtST/ZlnXo/FJuJl5pSsxQ9GTH7qD3pCxch5xREEZmaNYLAdzuNYZ4dlbYGwsW/z2my
         nxVyyA+LsvpSaiR+V237jdWKTs1RO2UQhEbpfvOjBVm0pyDcqOsQl2mp+0zzHKVH+itc
         ONzHa2xlsJiGmYeqHns8wheZq+qgV1xvolB4hGFbwGTmRtLNIMGjrGFyvOQP5Oi+vMRY
         laZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776267172; x=1776871972;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e5e7YwNWCtbTE/x5+I5oKOHLYRavpYy019TGcszzWak=;
        b=mQ+IcyNIVfJklfBFihk5ryZPoxml9KVpSIpwyVBbxB1Tdvin5zXwTpoxeUvOhc9ekH
         FcXZm019VHf88rz8U0+05kFqHz2YidzqrJnTtGQNk2/uEuSR33HO+fZnK9n2NR/FH2Ff
         e8vGW4kzb8pSnpyhj+uaSA9RsP1v/n8XZAc0KghKjLB8PYM3viNzKtvupN0wLM/HQCHz
         jd4SuKop7PnZTGQeJkJkYdN+kmY5+TmclPfr+FzMVFuExO3yesMgrE82iWzlZZJvMATT
         aFVsV3s99EdCZCgjoqEJJ+LxRvEpTuyhvcIbNORqahBxQOjG0Uc5AoC1sciY2H0HQOMo
         /NIw==
X-Forwarded-Encrypted: i=1; AFNElJ9IC0iWWviljj2KPveuVtpCzpVbEYDJOtVuqKfoUObpJn/9hvt55RzsDHzz901iWR8GztVq3HJ2sbc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+3FyEqJWdsSaCegZUqMRsMB3euUSak0/LHLBkSNWwYMtWHt1F
	vavK1oRVzw1LxEH2qTIkiBlxSyQNofsx1LN/s63nwc6INzd9RnzsGhTkgb5yV7FSzzg=
X-Gm-Gg: AeBDietSsFfbGBFk6+GfT0qyZoEYie1TIY3+ZlwXciSoRuhH8cyWbmvfN3aixK4sciH
	C5sng05GBBhgfdfcq5jY9uOJrA2I+vgoMlXeYkKgNwmUMlfT/g7C54nDAfNW42MIPFvQ6gwPeSr
	a0K+TC0OQUw6OuyN98iedMiYuGZb7MzcGMvzo0lqeUlP0MqKYRMKCbgRV8qYppeLj4eQwPCnhZh
	bB/cM/J6CJgEJslRbmODbSNHpXMG0fLC4cFc/dKyHDS5PlFpnAUOqOuLz6ctCp0HaGHekzRlQD+
	mXxP92v9l7TgkXDmWrYzcK2kCSHGAO+xw+S0huVhJJWV5BKntw67Z0MxnBeNG4n9PpkMlDZZjsm
	Xv/gtkji3GI8lopfoH3YQX+Nm06RM4uLk5JbM8VEIEtbHtaAj0kAKndKvTB41iGZHEudeT3gsud
	giVGVDTeuZ/2Rw2vnzemRmM5LBEIvDoPWZOGgldamex25j49hA
X-Received: by 2002:a05:690e:4188:b0:651:c024:5726 with SMTP id 956f58d0204a3-651c0245898mr12329101d50.33.1776267171618;
        Wed, 15 Apr 2026 08:32:51 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F ([2607:fb90:ea03:4042:f7e3:e9e9:9e22:5a8e])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ae6cb9ea1csm16952326d6.28.2026.04.15.08.32.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 08:32:50 -0700 (PDT)
Date: Wed, 15 Apr 2026 11:32:46 -0400
From: Gregory Price <gourry@gourry.net>
To: Matthew Wilcox <willy@infradead.org>
Cc: Miklos Szeredi <miklos@szeredi.hu>,
	"David Hildenbrand (Arm)" <david@kernel.org>,
	"Darrick J. Wong" <djwong@kernel.org>,
	John Groves <John@groves.net>,
	Joanne Koong <joannelkoong@gmail.com>,
	Bernd Schubert <bernd@bsbernd.com>,
	John Groves <john@jagalactic.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Bernd Schubert <bschubert@ddn.com>,
	Alison Schofield <alison.schofield@intel.com>,
	John Groves <jgroves@micron.com>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Vishal Verma <vishal.l.verma@intel.com>,
	Dave Jiang <dave.jiang@intel.com>, Jan Kara <jack@suse.cz>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Jeff Layton <jlayton@kernel.org>,
	Amir Goldstein <amir73il@gmail.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Stefan Hajnoczi <shajnocz@redhat.com>,
	Josef Bacik <josef@toxicpanda.com>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	Chen Linxuan <chenlinxuan@uniontech.com>,
	James Morse <james.morse@arm.com>, Fuad Tabba <tabba@google.com>,
	Sean Christopherson <seanjc@google.com>,
	Shivank Garg <shivankg@amd.com>,
	Ackerley Tng <ackerleytng@google.com>,
	Aravind Ramesh <arramesh@micron.com>,
	Ajay Joshi <ajayjoshi@micron.com>,
	"venkataravis@micron.com" <venkataravis@micron.com>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"nvdimm@lists.linux.dev" <nvdimm@lists.linux.dev>,
	"linux-cxl@vger.kernel.org" <linux-cxl@vger.kernel.org>,
	"linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
	djbw@kernel.org
Subject: Re: [PATCH V10 00/10] famfs: port into fuse
Message-ID: <ad-vnqRrUGs9n0N8@gourry-fedora-PF4VCD3F>
References: <adlBcwJjLOQDAR65@groves.net>
 <CAJnrk1a06zkUmXW5EFiUmgAoFauwtzsYvnotaPH0ifVtyh7iDQ@mail.gmail.com>
 <CAJfpegvVTcV89=q3L326aGQjhduBcv7PVg5QKftGLjNZmCLmaw@mail.gmail.com>
 <ad4_jFsR951c2Mtn@groves.net>
 <20260414185740.GA604658@frogsfrogsfrogs>
 <ad69tTnx5YkD4Y9K@gourry-fedora-PF4VCD3F>
 <f254f6fc-dc06-4612-82d7-35bb10dbd32e@kernel.org>
 <ad-UAMcALRubBcHk@gourry-fedora-PF4VCD3F>
 <CAJfpegsUVv0ziMSQiq9pKeXf6G-+LROPTW077hHMSmAirVCLQw@mail.gmail.com>
 <ad-qSB4oL5D3S-ht@casper.infradead.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ad-qSB4oL5D3S-ht@casper.infradead.org>
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[gourry.net:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-83514-lists,linux-doc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[gourry.net];
	RCPT_COUNT_TWELVE(0.00)[41];
	FREEMAIL_CC(0.00)[szeredi.hu,kernel.org,groves.net,gmail.com,bsbernd.com,jagalactic.com,intel.com,ddn.com,micron.com,lwn.net,linuxfoundation.org,suse.cz,zeniv.linux.org.uk,infradead.org,huawei.com,redhat.com,toxicpanda.com,uniontech.com,arm.com,google.com,amd.com,vger.kernel.org,lists.linux.dev];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	DKIM_TRACE(0.00)[gourry.net:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gourry@gourry.net,linux-doc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-doc];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gourry.net:dkim,gourry.net:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 1A947405FC2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 15, 2026 at 04:10:00PM +0100, Matthew Wilcox wrote:
> On Wed, Apr 15, 2026 at 04:04:50PM +0200, Miklos Szeredi wrote:
> > On Wed, 15 Apr 2026 at 15:35, Gregory Price <gourry@gourry.net> wrote:
> > 
> > > This was my first reaction when I realized the BPF program would be
> > > controlling iomap return value in the fault path.  Big ol' (!)  popped
> > > up over my head.
> > 
> > I'm wondering which part of this triggers the big (!).
> > 
> > BPF program being run in the fault path?
> > 
> > Or that the return value from the BPF function is used as iomap?
> > 
> > Or something else?
> 
> If a BPF program controls what memory address a fault now allows access
> to, who validates that this is a memory address within the purview of
> the BPF program, and not, say, the address of the kernel page tables?
> 
> (I have done no looking to determine if this is already considered)

From an initial look at the existing bpf ops structures, I do not see
any other struct with a similar (obvious) pattern - so it's not clear to
me such a concern has been exposed elsewhere or directly addressed.

There is a verifier step for the BPF program that in theory would
validate the range matches the DAX ranges, but i think that only
validates the types are right and only on load - I think the BPF
program itself would be the address validater, which is a strong no.

BPF folks please correct me if i'm off base here.

My initial take is that it's a real concern a "bug" in a BPF program
could let userland map arbitrary memory into userland page tables, and
such an extension would not be a quick fix to the FAMFS problem.

~Gregory

