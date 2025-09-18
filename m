Return-Path: <linux-doc+bounces-59738-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 16941B5159B
	for <lists+linux-doc@lfdr.de>; Wed, 10 Sep 2025 13:27:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D91277AD889
	for <lists+linux-doc@lfdr.de>; Wed, 10 Sep 2025 11:24:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B40C727E049;
	Wed, 10 Sep 2025 11:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UcYzNM/H"
X-Original-To: linux-doc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2BE527B50C
	for <linux-doc@vger.kernel.org>; Wed, 10 Sep 2025 11:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757503531; cv=none; b=ITa4iYWm/vEtzAAJCxSNxTYZjyUDeVctRv5U6Ig9DQPS6cDLR/Ds+modWZbFWSIiFtTj2zQWrt4/BLQ668CuG65KSyCCrFojCd83ubshfc8JkmIl/Frvy+2OI1aLMpiuzmrPYfKRGa9V+3WUIpRKMmyV3zINR5Ll3gQ6UpB1nEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757503531; c=relaxed/simple;
	bh=h9KEh2ojjm4QzM68ao2k0Bf1IqYGEbISWkQH5/yxjTE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SOPespEgnd4g44oL8DZeDBRDh6ySrXLrhLHMqx3wRTyNFfW23J1CZdWrUu4kWqlHQADv2JHHKfmhBTxE8M3qzCbDX4G5mzwJzkbNQmjSM0IAtYT1BeF13hCOtLecXwui0AJCgE9hDOLeFAlRMJcrqnrb5apSNvr/fyrd4K9ncgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UcYzNM/H; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1757503529;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XL4ruzM8AedzL+ahlUWIyyVR3AHZTuigDMBK5B/nuAs=;
	b=UcYzNM/HStovr8jpnO8j2MvTuBJVqz7zKepLFKfcvVsgLyCjaGBZPWoz5Q0O1TxlsZysUX
	vbHOoFBGPiBZ+45/XPLXBG829PlhwTvqR+YK+LyeDxmJFB3Gk9DTsMRhz2z/jVdKebyWu5
	ZLwUfNr8UJMidq2LSRn+d2wtwcqSDNM=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-593-yL89Kfc2Oc69JjLOL0x3FA-1; Wed, 10 Sep 2025 07:25:27 -0400
X-MC-Unique: yL89Kfc2Oc69JjLOL0x3FA-1
X-Mimecast-MFC-AGG-ID: yL89Kfc2Oc69JjLOL0x3FA_1757503527
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-24b0e137484so57058005ad.0
        for <linux-doc@vger.kernel.org>; Wed, 10 Sep 2025 04:25:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757503527; x=1758108327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XL4ruzM8AedzL+ahlUWIyyVR3AHZTuigDMBK5B/nuAs=;
        b=LCQBG8KJs9nN27v7WPnrsi7tkmkZ6fGGVRtGm/YYl922bsZskJs+FQyETOHKO10Y7k
         9zra75mW89hA2OWllxNU4BEFaeWaModK24XuaGWdDZfnHF7+Uza15bTSPd61Nqdy+wEK
         PZ3lwNAaEK18lbuGUJoXrB3HnlDHOyMEY2MAwnEcch3UmPwuUD6OTKXgwmaSyLbi8HNf
         AJDPJzSM1OipeVJzQx8k+G4+GST8LDPeKCsBSRRjW7CPBlBzcGN7Tg3igHsFYx9kOiBW
         7wi0/xfMZcW54kt3HOVuu1yBc4BsZ7JgLiYPXnB+ybcIxbfF9nkT9ZX6I9PJawaB2Pf0
         RTMg==
X-Forwarded-Encrypted: i=1; AJvYcCXF5rOElqYVLOzDcPU7mqIqSj0fyNLCOAu/aU0bwsTrBKRH3ANzoXX5kUXu4b5zbqmSkzgGgGzu1Dg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwkxM5sb0kAEtN7X9IMNxO+zY27KGr+TufTISriuRsWp3q/+ck0
	uqyoAUAG6QxX8F5H8yHU8Cn+iybKLSJrMfbldi2mJpYUD9AYzdtssRxxS8DlLc+LQIPjBPmpmFb
	nOSG8P12cFimHoPgEyW0TKJfqIC1vjGFbet+bVVBIbdbcWiSuZPQ3EBCLZ3ZqrMrPuXvK3jqZsX
	U+B2ePCeYW7OVq5sT8a6p2xvZGqCCE6UqRxufY
X-Gm-Gg: ASbGncuD8Mq7zJJbDQklJR6AHH9q/XjecBSDpI4+dmuZcOFDt9OQ7Pe2+8bwHT2zXVR
	omc/4oU5/yrj+p/FIMHMuozihfeHrUiG0KwxKPT6M8XS1SZ3g+zxlmkpaxuaAewg6rQcYOiEMqD
	maO0/oqvta1iLMMts7VXg=
X-Received: by 2002:a17:902:ec8e:b0:249:3049:9748 with SMTP id d9443c01a7336-25172292005mr202948365ad.35.1757503526556;
        Wed, 10 Sep 2025 04:25:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEaR+bhiVPNWt4QUvKQuVLEZvF3jJd3Ijjzb5yVlhxYaVgjP/2E3HUPYMEMrrYf689RheFHiy2DBowGyHRCSec=
X-Received: by 2002:a17:902:ec8e:b0:249:3049:9748 with SMTP id
 d9443c01a7336-25172292005mr202948025ad.35.1757503526115; Wed, 10 Sep 2025
 04:25:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250909014606.15043-1-bagasdotme@gmail.com> <874itbv23b.fsf@trenco.lwn.net>
 <aMC4LIltHWlpF9iY@archie.me>
In-Reply-To: <aMC4LIltHWlpF9iY@archie.me>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Wed, 10 Sep 2025 13:25:13 +0200
X-Gm-Features: AS18NWDq9XC6oKyEKwpzcoWeu3xT29_fWXpazweCsAqUf0bE5KqQor3qN_vB9ag
Message-ID: <CAHc6FU709iYrAVB+2DeL8+AkCMtgwtqC-7ikx+f=wqYPAZfjmg@mail.gmail.com>
Subject: Re: [PATCH v3] Documentation: gfs2: Consolidate GFS2 docs into its
 own subdirectory
To: Bagas Sanjaya <bagasdotme@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Documentation <linux-doc@vger.kernel.org>, Linux GFS2 <gfs2@lists.linux.dev>, 
	Randy Dunlap <rdunlap@infradead.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Christian Brauner <brauner@kernel.org>, Miklos Szeredi <mszeredi@redhat.com>, 
	"Darrick J. Wong" <djwong@kernel.org>, Jan Kara <jack@suse.cz>, Bernd Schubert <bschubert@ddn.com>, 
	Jeff Layton <jlayton@kernel.org>, James Morse <james.morse@arm.com>, 
	Chen Linxuan <chenlinxuan@uniontech.com>, Matthew Wilcox <willy@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 10, 2025 at 1:28=E2=80=AFAM Bagas Sanjaya <bagasdotme@gmail.com=
> wrote:
> On Tue, Sep 09, 2025 at 01:48:56PM -0600, Jonathan Corbet wrote:
> > Bagas Sanjaya <bagasdotme@gmail.com> writes:
> >
> > > Documentation for GFS2 is scattered in three docs that are in
> > > Documentation/filesystems/ directory. As these docs are standing out =
as
> > > a group, move them into separate gfs2/ subdirectory.
> > >
> > > Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
> > > Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
> > > ---
> > > Changes since v2 [1]:
> > >
> > >   * Do not use wildcard on MAINTAINERS file entry and add review tag =
(Randy)
> > >
> > > [1]: https://lore.kernel.org/linux-doc/20250827022122.12132-1-bagasdo=
tme@gmail.com/
> > >
> > >  .../filesystems/{gfs2-glocks.rst =3D> gfs2/glocks.rst} |  0
> > >  Documentation/filesystems/gfs2/index.rst             | 12 ++++++++++=
++
> > >  .../filesystems/{gfs2.rst =3D> gfs2/overview.rst}      |  6 +++---
> > >  .../{gfs2-uevents.rst =3D> gfs2/uevents.rst}           |  0
> > >  Documentation/filesystems/index.rst                  |  4 +---
> > >  MAINTAINERS                                          |  2 +-
> > >  6 files changed, 17 insertions(+), 7 deletions(-)
> > >  rename Documentation/filesystems/{gfs2-glocks.rst =3D> gfs2/glocks.r=
st} (100%)
> > >  create mode 100644 Documentation/filesystems/gfs2/index.rst
> > >  rename Documentation/filesystems/{gfs2.rst =3D> gfs2/overview.rst} (=
96%)
> > >  rename Documentation/filesystems/{gfs2-uevents.rst =3D> gfs2/uevents=
.rst} (100%)
> >
> > I'm not sure which tree this is meant to go through ...
>
> There's linux-gfs2 tree (see MAINTAINERS)

Sure, I can take it. Can you please send your v4 patch to gfs2@lists.linux.=
dev?

Thanks,
Andreas


