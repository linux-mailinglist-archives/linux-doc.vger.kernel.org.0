Return-Path: <linux-doc+bounces-27621-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C44F699F820
	for <lists+linux-doc@lfdr.de>; Tue, 15 Oct 2024 22:32:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DE92C1C21C9A
	for <lists+linux-doc@lfdr.de>; Tue, 15 Oct 2024 20:32:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 092B91F585F;
	Tue, 15 Oct 2024 20:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jodbh/7Q"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 689B61A76DD;
	Tue, 15 Oct 2024 20:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729024328; cv=none; b=InY4k04b66JxyqFmTOXLh1VL6NJgAR3Iet1UwXzB3/F1Hxa0SQnmEiS3H6FCXm4i1Wcb93aDV8S8HEOAv+p8tgXWideaaHnK70vDl5b/Q6B+pVGjVu4Bz7Sdq8W92+0WmNTNfp7Y8TSdJZedWKFKvCHWKnm5DYjnAoa2Yl39pxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729024328; c=relaxed/simple;
	bh=8cDk11iDvyKZdnVjT+Yr5+r88bYjxh1eB4rjAMWjKkc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eM6D0UabsjOyhoqrjeXtWisyZCc/CC6DEZOP7m9JL+CSySurIhDLOB9W/w5J3gk8ezHloZojeCKxNBxgsZ+55TvH8LBdx/7vx5+sljUUov2VCMocMxOnBpXnPuc8U0jMiKJpOs9YKHgcQw4Yhy/bqB4HXoNQj9F/qsUYq8Q33CY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jodbh/7Q; arc=none smtp.client-ip=209.85.210.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-7165df3a85fso3408585a34.3;
        Tue, 15 Oct 2024 13:32:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729024326; x=1729629126; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KBWtkqYz09+QJinmIo782z9Z/cy1lkhmhnz03IFAMnw=;
        b=jodbh/7Q4e4jb+aX5vBd8rsHZvsNEPIdTqDT/2vkfXVKoL4ui6GKy6aWzKWCwFuFMs
         W8ZJ86+WNFBHBlHiOCvX/rKUYA+2Uqb9x8epSuh0ldQPXw/qCtE5pkBYR4otZbczrQOX
         vH9aV0NUyDEID7dTz8t+fQAMfg92xsKHDHzd0nOQrQwZ5lGDFCpmQpv3zqcXJsgq3l1A
         YXmF3dmy5+VvHzzjpFWe0szQ/MZYz7x/J2BeoVNAQmk/5CnzBOgldG7+YGY/9PJ+nNW4
         LTAEVlU3P65bbYDq+qO1Aeb+D8hPnnngxXCS+X5C8rdDLeqCmFUNT8oPNB9Yn983Eola
         gXEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729024326; x=1729629126;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KBWtkqYz09+QJinmIo782z9Z/cy1lkhmhnz03IFAMnw=;
        b=XoofPpCyqXT3YRtuPAgKP6efgX5JLkOKpaCfQF1fpasLthyN8VIPZICuTAh0m9rHNb
         mfO5CYif9zLvy4rgX5pY0I6tA7F53pAcCHcdx8TLNOWf2DtwhIAODvEjg66ft59xHWcS
         NZpaoOzgJn4QLViIKqohw/DXfY2JdwOBn2auDbX+ebmk5f3lVjuf5jG/xG3jdyYUjcfu
         aQVKN6NtFYGgJ2vVEBCHdzXACszQA/rrkQzsdO+82CjFoZ7E+9vYTMeQ9JEwyGEJCag3
         3AWeRGJ4z4qvbPSSiPf/ZYP0kkkf2th55EI13ZxOkN/DIExPEpmVxkZ/zv32RFn4XNQ4
         gkGw==
X-Forwarded-Encrypted: i=1; AJvYcCUxJMKH4uSLE/tgD85tgBYCT+hrmhcd7XdZW10rqmRgVhrvv6sQFDV6xRnzSbq6XhW+Ho2txN+/MB0j@vger.kernel.org, AJvYcCVZ0HTkamXgroCYAFUO04Q6WzoB4y3E6M0xHkoIg/zBwZzHzql+91KYCkpBnw6WKOMPG0pE28A4NfI=@vger.kernel.org, AJvYcCWk+1Ea8B48kBBZvG3Qvizgp7WHxuolyUb93EN+CqyxC4L22XTg7Cc3W50n/b7wjRnSOUY+aMMuF5CUlziU@vger.kernel.org
X-Gm-Message-State: AOJu0YwWGvdHnBQdJ1psMr7Nnq+sHL9wUi/4QOBiVawzrAWO8RGB5P/h
	q0nAi+jegTQftA5ph9wb74YxUXWOI2z61RMRyJhN3aN4RsagRz8P
X-Google-Smtp-Source: AGHT+IFZ4ct4q2Mizm93//1ZugEn+brrjtMJxnlhiRa5oGsO3yagcbzr7QcW+w6XeuZx4Ex7ealEWQ==
X-Received: by 2002:a05:6830:4486:b0:717:d0a1:f15b with SMTP id 46e09a7af769-717d640e836mr12038133a34.4.1729024326122;
        Tue, 15 Oct 2024 13:32:06 -0700 (PDT)
Received: from illithid ([2600:1700:957d:1d70::49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-718045ee6cdsm159296a34.50.2024.10.15.13.32.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2024 13:32:04 -0700 (PDT)
Date: Tue, 15 Oct 2024 15:32:02 -0500
From: "G. Branden Robinson" <g.branden.robinson@gmail.com>
To: Ian Rogers <irogers@google.com>
Cc: Alejandro Colomar <alx@kernel.org>, David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Jonathan Corbet <corbet@lwn.net>, dri-devel@lists.freedesktop.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-man@vger.kernel.org
Subject: Re: [PATCH v1 1/3] proc_pid_fdinfo.5: Reduce indent for most of the
 page
Message-ID: <20241015203202.vyfi4nykkid35luj@illithid>
References: <20241015183824.1014964-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="optj6anisaxduzt3"
Content-Disposition: inline
In-Reply-To: <20241015183824.1014964-1-irogers@google.com>


--optj6anisaxduzt3
Content-Type: multipart/mixed; protected-headers=v1;
	boundary="2r75hx4jq6yflj7c"
Content-Disposition: inline
Subject: Re: [PATCH v1 1/3] proc_pid_fdinfo.5: Reduce indent for most of the
 page
MIME-Version: 1.0


--2r75hx4jq6yflj7c
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

At 2024-10-15T11:38:22-0700, Ian Rogers wrote:
> When /proc/pid/fdinfo was part of proc.5 man page the indentation made
> sense. As a standalone man page the indentation doesn't need to be so
> far over to the right.
>=20
> Signed-off-by: Ian Rogers <irogers@google.com>
> ---
>  man/man5/proc_pid_fdinfo.5 | 50 +++++++++++++++++++-------------------
>  1 file changed, 25 insertions(+), 25 deletions(-)
>=20
> diff --git a/man/man5/proc_pid_fdinfo.5 b/man/man5/proc_pid_fdinfo.5
> index 1e23bbe02..0c4950d5d 100644
> --- a/man/man5/proc_pid_fdinfo.5
> +++ b/man/man5/proc_pid_fdinfo.5
> @@ -8,8 +8,9 @@
>  .SH NAME
>  /proc/pid/fdinfo/ \- information about file descriptors
>  .SH DESCRIPTION
> -.TP
> +.TP 0
>  .IR /proc/ pid /fdinfo/ " (since Linux 2.6.22)"
> +.P
>  This is a subdirectory containing one entry for each file which the
>  process has open, named by its file descriptor.
>  The files in this directory are readable only by the owner of the proces=
s.

I don't find this usage to be idiomatic.

There's no point having a tagged paragraph if you want that paragraph's
indentation to be zero.

I'll grant that it's also unusual to have a man page's "Description"
section lurch straight into a definition list without any preamble.

Since the only topic of this man page is now the file (or class of
files) in question, I suggest dropping the paragraph tag altogether
since it duplicates the summary description.

And as it happens, you can put font styling _in_ the summary desription.

So I suggest something like:

=2ESH NAME
=2EIR /proc/ pid /fdinfo " \- information about file descriptors"
=2ESH DESCRIPTION
Since Linux 2.6.22,
this subdirectory contains one entry for each file that process
=2EI pid
has open,
named for its file descriptor.

This renders fine with groff and mandoc(1).

Sample page attached.

Regards,
Branden

--2r75hx4jq6yflj7c
Content-Type: application/x-troff-man
Content-Disposition: attachment; filename="proc_pid_fdinfo_ropers.man"
Content-Transfer-Encoding: quoted-printable

=2E\" Copyright (C) 1994, 1995, Daniel Quinlan <quinlan@yggdrasil.com>=0A.\=
" Copyright (C) 2002-2008, 2017, Michael Kerrisk <mtk.manpages@gmail.com>=
=0A.\" Copyright (C) 2023, Alejandro Colomar <alx@kernel.org>=0A.\"=0A.\" S=
PDX-License-Identifier: GPL-3.0-or-later=0A.\"=0A.TH proc_pid_fdinfo 5 (dat=
e) "Linux man-pages (unreleased)"=0A.SH NAME=0A.IR /proc/ pid /fdinfo " \- =
information about file descriptors"=0A.SH DESCRIPTION=0ASince Linux 2.6.22,=
=0Athis subdirectory contains one entry for each file that process=0A.I pid=
=0Ahas open,=0Anamed for its file descriptor.=0AThe contents of each file c=
an be read to obtain information=0Aabout the corresponding file descriptor.=
=0AThe content depends on the type of file referred to by the=0Acorrespondi=
ng file descriptor.=0A.P=0AFor regular files and directories, we see someth=
ing like:=0A.P=0A.in +4n=0A.EX=0A.RB "$" " cat /proc/12015/fdinfo/4"=0Apos:=
    1000=0Aflags:  01002002=0Amnt_id: 21=0A.EE=0A.in=0A.P=0AThe fields are =
as follows:=0A.TP=0A.I pos=0AThis is a decimal number showing the file offs=
et.=0A.TP=0A.I flags=0AThis is an octal number that displays the=0Afile acc=
ess mode and file status flags (see=0A.BR open (2)).=0AIf the close-on-exec=
 file descriptor flag is set, then=0A.I flags=0Awill also include the value=
=0A.BR O_CLOEXEC .=0A.P=0ABefore Linux 3.1,=0A.\" commit 1117f72ea0217ba0cc=
19f05adbbd8b9a397f5ab7=0Athis field incorrectly displayed the setting of=0A=
=2EB O_CLOEXEC=0Aat the time the file was opened,=0Arather than the current=
 setting of the close-on-exec flag.=0A.TP=0A.I=0A.I mnt_id=0AThis field, pr=
esent since Linux 3.15,=0A.\" commit 49d063cb353265c3af701bab215ac438ca7df3=
6d=0Ais the ID of the mount containing this file.=0ASee the description of=
=0A.IR /proc/ pid /mountinfo .=0A.P=0AFor eventfd file descriptors (see=0A.=
BR eventfd (2)),=0Awe see (since Linux 3.8)=0A.\" commit cbac5542d48127b546=
a23d816380a7926eee1c25=0Athe following fields:=0A.P=0A.in +4n=0A.EX=0Apos:	=
0=0Aflags:	02=0Amnt_id:	10=0Aeventfd\-count:               40=0A.EE=0A.in=
=0A.P=0A.I eventfd\-count=0Ais the current value of the eventfd counter, in=
 hexadecimal.=0A.P=0AFor epoll file descriptors (see=0A.BR epoll (7)),=0Awe=
 see (since Linux 3.8)=0A.\" commit 138d22b58696c506799f8de759804083ff9effa=
e=0Athe following fields:=0A.P=0A.in +4n=0A.EX=0Apos:	0=0Aflags:	02=0Amnt_i=
d:	10=0Atfd:        9 events:       19 data: 74253d2500000009=0Atfd:       =
 7 events:       19 data: 74253d2500000007=0A.EE=0A.in=0A.P=0AEach of the l=
ines beginning=0A.I tfd=0Adescribes one of the file descriptors being monit=
ored via=0Athe epoll file descriptor (see=0A.BR epoll_ctl (2)=0Afor some de=
tails).=0AThe=0A.I tfd=0Afield is the number of the file descriptor.=0AThe=
=0A.I events=0Afield is a hexadecimal mask of the events being monitored fo=
r this file=0Adescriptor.=0AThe=0A.I data=0Afield is the data value associa=
ted with this file descriptor.=0A.P=0AFor signalfd file descriptors (see=0A=
=2EBR signalfd (2)),=0Awe see (since Linux 3.8)=0A.\" commit 138d22b58696c5=
06799f8de759804083ff9effae=0Athe following fields:=0A.P=0A.in +4n=0A.EX=0Ap=
os:	0=0Aflags:	02=0Amnt_id:	10=0Asigmask:	0000000000000006=0A.EE=0A.in=0A.P=
=0A.I sigmask=0Ais the hexadecimal mask of signals that are accepted via th=
is=0Asignalfd file descriptor.=0A(In this example, bits 2 and 3 are set, co=
rresponding to the signals=0A.B SIGINT=0Aand=0A.BR SIGQUIT ;=0Asee=0A.BR si=
gnal (7).)=0A.P=0AFor inotify file descriptors (see=0A.BR inotify (7)),=0Aw=
e see (since Linux 3.8)=0Athe following fields:=0A.P=0A.in +4n=0A.EX=0Apos:=
	0=0Aflags:	00=0Amnt_id:	11=0Ainotify wd:2 ino:7ef82a sdev:800001 mask:800a=
fff ignored_mask:0 fhandle\-bytes:8 fhandle\-type:1 f_handle:2af87e00220ffd=
73=0Ainotify wd:1 ino:192627 sdev:800001 mask:800afff ignored_mask:0 fhandl=
e\-bytes:8 fhandle\-type:1 f_handle:27261900802dfd73=0A.EE=0A.in=0A.P=0AEac=
h of the lines beginning with "inotify" displays information about=0Aone fi=
le or directory that is being monitored.=0AThe fields in this line are as f=
ollows:=0A.TP=0A.I wd=0AA watch descriptor number (in decimal).=0A.TP=0A.I =
ino=0AThe inode number of the target file (in hexadecimal).=0A.TP=0A.I sdev=
=0AThe ID of the device where the target file resides (in hexadecimal).=0A.=
TP=0A.I mask=0AThe mask of events being monitored for the target file (in h=
exadecimal).=0A.P=0AIf the kernel was built with exportfs support, the path=
 to the target=0Afile is exposed as a file handle, via three hexadecimal fi=
elds:=0A.IR fhandle\-bytes ,=0A.IR fhandle\-type ,=0Aand=0A.IR f_handle .=
=0A.P=0AFor fanotify file descriptors (see=0A.BR fanotify (7)),=0Awe see (s=
ince Linux 3.8)=0Athe following fields:=0A.P=0A.in +4n=0A.EX=0Apos:	0=0Afla=
gs:	02=0Amnt_id:	11=0Afanotify flags:0 event\-flags:88002=0Afanotify ino:19=
264f sdev:800001 mflags:0 mask:1 ignored_mask:0 fhandle\-bytes:8 fhandle\-t=
ype:1 f_handle:4f261900a82dfd73=0A.EE=0A.in=0A.P=0AThe fourth line displays=
 information defined when the fanotify group=0Awas created via=0A.BR fanoti=
fy_init (2):=0A.TP=0A.I flags=0AThe=0A.I flags=0Aargument given to=0A.BR fa=
notify_init (2)=0A(expressed in hexadecimal).=0A.TP=0A.I event\-flags=0AThe=
=0A.I event_f_flags=0Aargument given to=0A.BR fanotify_init (2)=0A(expresse=
d in hexadecimal).=0A.P=0AEach additional line shown in the file contains i=
nformation=0Aabout one of the marks in the fanotify group.=0AMost of these =
fields are as for inotify, except:=0A.TP=0A.I mflags=0AThe flags associated=
 with the mark=0A(expressed in hexadecimal).=0A.TP=0A.I mask=0AThe events m=
ask for this mark=0A(expressed in hexadecimal).=0A.TP=0A.I ignored_mask=0AT=
he mask of events that are ignored for this mark=0A(expressed in hexadecima=
l).=0A.P=0AFor details on these fields, see=0A.BR fanotify_mark (2).=0A.P=
=0AFor timerfd file descriptors (see=0A.BR timerfd (2)),=0Awe see (since Li=
nux 3.17)=0A.\" commit af9c4957cf212ad9cf0bee34c95cb11de5426e85=0Athe follo=
wing fields:=0A.P=0A.in +4n=0A.EX=0Apos:    0=0Aflags:  02004002=0Amnt_id: =
13=0Aclockid: 0=0Aticks: 0=0Asettime flags: 03=0Ait_value: (7695568592, 640=
020877)=0Ait_interval: (0, 0)=0A.EE=0A.in=0A.TP=0A.I clockid=0AThis is the =
numeric value of the clock ID=0A(corresponding to one of the=0A.B CLOCK_*=
=0Aconstants defined via=0A.IR <time.h> )=0Athat is used to mark the progre=
ss of the timer (in this example, 0 is=0A.BR CLOCK_REALTIME ).=0A.TP=0A.I t=
icks=0AThis is the number of timer expirations that have occurred,=0A(i.e.,=
 the value that=0A.BR read (2)=0Aon it would return).=0A.TP=0A.I settime fl=
ags=0AThis field lists the flags with which the timerfd was last armed (see=
=0A.BR timerfd_settime (2)),=0Ain octal=0A(in this example, both=0A.B TFD_T=
IMER_ABSTIME=0Aand=0A.B TFD_TIMER_CANCEL_ON_SET=0Aare set).=0A.TP=0A.I it_v=
alue=0AThis field contains the amount of time until the timer will next exp=
ire,=0Aexpressed in seconds and nanoseconds.=0AThis is always expressed as =
a relative value,=0Aregardless of whether the timer was created using the=
=0A.B TFD_TIMER_ABSTIME=0Aflag.=0A.TP=0A.I it_interval=0AThis field contain=
s the interval of the timer,=0Ain seconds and nanoseconds.=0A(The=0A.I it_v=
alue=0Aand=0A.I it_interval=0Afields contain the values that=0A.BR timerfd_=
gettime (2)=0Aon this file descriptor would return.)=0A.SH SEE ALSO=0A.BR p=
roc (5)=0A
--2r75hx4jq6yflj7c--

--optj6anisaxduzt3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEh3PWHWjjDgcrENwa0Z6cfXEmbc4FAmcO0TsACgkQ0Z6cfXEm
bc6Wug//XQw8suXg/QZYuTDM2CpN6NjRSCDh+QMUCcKLjGmoUW4p7C6FBlWMrHVA
JLK1WYl8il3ruGJYfaPWct8wnLSNNyuzoqpuQMGMkli8Iaq6jbDHXpG7n3DjFkJm
h76ZWvaBsIaO5d33ZMqe6+3+Qr2SYdVg2l25oWY6Iag/h8Tm2BgCx7l9p0vXJ8HP
1iU05/RWL8OLzDyy5f4Lz3DPkH/bFhdUFSxdjOHrJ2O6m+8s1g7fTu2BoYMQ5E96
Zrv80c7ArDqD/L9uXwLlCgfKlbVwO7h1HvUosz6CZGGRrigmv0l6/9eY1BU5EBSm
BbsegBysJLa2mRSn+RnCzITabOCqC6O/omTfbt6CssI0YzMDAO66xM2qFhjtzoCs
U4QNzybh1nQdC7u8zR/3VOW3FMC/7VeFjWf0fccZVDeeu9pl6fDhmElLqpbEgYEW
fGN3eVFKvGvgXHBGwC8roDr+6IAMMA0fg1UWzGuQEDHE9kJaXmWCoimFjkZ/y189
/+b5gIze2adz+x/EHYeBNf0GZ2cvN21nYjUUgGnVqMRRHdKMvJDJmibpQuip+yXu
ZBvhntojotTw7yHzvrX/OMn2a5kv8kOKGF/BMvc8J8wN186JxpOAmNDTq69sbqn6
tTmv8zWYFA9VwNK2RKTpaPDeMfTooo+b9Da4WuZfZrioyy/Kqw0=
=e1Na
-----END PGP SIGNATURE-----

--optj6anisaxduzt3--

