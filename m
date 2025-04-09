Return-Path: <linux-doc+bounces-42692-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 19683A820AC
	for <lists+linux-doc@lfdr.de>; Wed,  9 Apr 2025 11:06:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3D8E442672A
	for <lists+linux-doc@lfdr.de>; Wed,  9 Apr 2025 09:05:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 361B625D541;
	Wed,  9 Apr 2025 09:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TfvL56+P"
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 892B825D522
	for <linux-doc@vger.kernel.org>; Wed,  9 Apr 2025 09:05:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744189547; cv=none; b=nvQf6hHFHPO3dMWLc34RpPNbPBGWQv14Vq7KDbdhV5HZAIhAt1f8Gn1IWEuOZGfYzXFqPNtiuG3WO6198R68MHnX//WQ4CH1NXWzwCLCQeWUW/bnyOIkG0tzu1ydoP96Bym8AZR4cTMy8W+72G88v27GESWotBRqD+vqoHyyWlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744189547; c=relaxed/simple;
	bh=4FJQGC34wMHXrFTz2OgWJo2CC4YJBjF3ZTFg3I0hoCo=;
	h=From:In-Reply-To:References:To:Cc:Subject:MIME-Version:
	 Content-Type:Date:Message-ID; b=myIMv/DpiPMkXRDSZYlZbk+q/2VuXfHiTZbmJR2cEr4FA/VghIGqunE2vdjSD/m//KNTSv07fAIl8a7UK9o6AWZITg9GrtsVD9AVuYCW29wuamlqAVH/SWi4Jyrr4RmmnFujqBDlrLKlAxewBblMD+GQuKd0lp64a+cjU2w4z/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TfvL56+P; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744189544;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3UGFJDqQi62IFAxWY5NIIYa7i9DNA3RekQiT9pyITt0=;
	b=TfvL56+P2+9WhVTGc6kFAxp0yuuibwjCbUXd7QTWt2ftD+DEYoLsALhcE908l7JddJ9sPz
	WX7IniS06DuI9KtvmRy7t1Bk0MuPnV2OxUlRZdoFXvXDHJqubbnd87UjZifkOicfVcw33m
	HHHClPjwakAwW1RsPR+YludA6cXckSs=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-574-KrVHnKwZPtiWgWF8QTwieQ-1; Wed,
 09 Apr 2025 05:05:37 -0400
X-MC-Unique: KrVHnKwZPtiWgWF8QTwieQ-1
X-Mimecast-MFC-AGG-ID: KrVHnKwZPtiWgWF8QTwieQ_1744189536
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C525D195608F;
	Wed,  9 Apr 2025 09:05:35 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.42.28.40])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id EC937180175B;
	Wed,  9 Apr 2025 09:05:30 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <Z_XOr4Ak4S0EOdrw@archie.me>
References: <Z_XOr4Ak4S0EOdrw@archie.me> <1565252.1744124997@warthog.procyon.org.uk>
To: Bagas Sanjaya <bagasdotme@gmail.com>
Cc: dhowells@redhat.com, Christian Brauner <brauner@kernel.org>,
    Paulo Alcantara <pc@manguebit.com>, Jeff Layton <jlayton@kernel.org>,
    Viacheslav Dubeyko <slava@dubeyko.com>,
    Alex Markuze <amarkuze@redhat.com>, Timothy Day <timday@amazon.com>,
    Jonathan Corbet <corbet@lwn.net>, netfs@lists.linux.dev,
    linux-doc@vger.kernel.org, linux-fsdevel@vger.kernel.org,
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH] netfs: Update main API document
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <1657440.1744189529.1@warthog.procyon.org.uk>
Content-Transfer-Encoding: quoted-printable
Date: Wed, 09 Apr 2025 10:05:29 +0100
Message-ID: <1657441.1744189529@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

Bagas Sanjaya <bagasdotme@gmail.com> wrote:

> > + * For writeback, it is unknown how much there will be to write until=
 the
>                                              "... will be written ..."
> > +   pagecache is walked, so no limit is set by the library.

No, I mean "how much there will be to write" - ie. how much dirty data the=
re
is in the pagecache.

> > +Further, if a read from the cache fails, the library will ask the fil=
esystem to
> > +do the read instead, renegotiating and retiling the subrequests as ne=
cessary.
> Read from the filesystem itself or direct read?

I'm not sure what you mean.  Here, I'm talking about read subrequests - i.=
e. a
subrequest that corresponds to a BIO issued to the cache or a single RPC
issued to the server.  Things like DIO and pagecache are at a higher level=
 and
not directly exposed to the filesystem.

Maybe I should amend the text to read:

	Further, if one or more subrequests issued to read from the cache
	fail, the library will issue them to the filesystem instead,
	renegotiating and retiling the subrequests as necessary.

> > +Netfslib will pin resources on an inode for future writeback (such as=
 pinning
> > +use of an fscache cookie) when an inode is dirtied.  However, this ne=
eds
> > +managing.  Firstly, a function is provided to unpin the writeback in
> inode management?
> > +``->write_inode()``::

Is "inode management" meant to be a suggested insertion or an alternative =
for
the subsection title?

> > -The above fields are the ones the netfs can use.  They are:
> > +They are:
> "These fields are, in detail:"

It feels unnecessarily repetitive to say "these fields", but "they are" al=
so
sounds stilted.  How about I rearrange things a little.

    The request structure manages the request as a whole, holding some res=
ources
    and state on behalf of the filesystem and tracking the collection of r=
esults::

	    struct netfs_io_request {
		    enum netfs_io_origin	origin;
		    struct inode		*inode;
		    struct address_space	*mapping;
		    struct netfs_group	*group;
		    struct netfs_io_stream	io_streams[];
		    void			*netfs_priv;
		    void			*netfs_priv2;
		    unsigned long long	start;
		    unsigned long long	len;
		    unsigned long long	i_size;
		    unsigned int		debug_id;
		    unsigned long		flags;
		    ...
	    };

    Many of the fields are for internal use, but the fields shown here are=
 of
    interest to the filesystem:

     * ``origin``
    ...

And then put the bit about wrapping the struct after the field explanation=
:
    =

    If the filesystem wants more private data than is afforded by this str=
ucture,
    then it should wrap it and provide its own allocator.

> > +   This is not permitted to return an error.  In the event of failure=
,
> > +   ``netfs_prepare_write_failed()`` must be called.
> "This method is not permitted to return an error. Instead, in the event =
of
> failure, ..."

Seems superfluous, but okay.

(Btw, can you put a blank line before your "> <snipped>..." to make it eas=
ier
to go through your reply?)

Thanks,
David


