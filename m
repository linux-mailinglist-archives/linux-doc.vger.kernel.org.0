Return-Path: <linux-doc+bounces-32364-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3192C9EA6AD
	for <lists+linux-doc@lfdr.de>; Tue, 10 Dec 2024 04:31:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E35432866A3
	for <lists+linux-doc@lfdr.de>; Tue, 10 Dec 2024 03:31:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 687E01BEF7E;
	Tue, 10 Dec 2024 03:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Yonfa6r2"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB42F3C17
	for <linux-doc@vger.kernel.org>; Tue, 10 Dec 2024 03:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733801510; cv=none; b=AH0cJ8bHwRecgB/rjNod1ix6bMJCODu2e5noxAH3oWtY+Vnnn0r8+4hHtmcFy20IQO/CZpMWoteNOuPdh5nhCP4l9LMUaYsoefh83Zbs35KlMV0FXpnfxG3oL9zA8DJV9wz9wyADKYbtS8hEEyjssK1Vv0rxhuiwMxEOvWLTxcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733801510; c=relaxed/simple;
	bh=FNzKszCuHp8YBw4zUen9q+/Su0cHKgEr5TQylNKG7Rg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VjK/4CcA17nKstnTiRDiqnAdPEF2h7lKQ4U3uc71NVpwlTqiCUvWAZP6Z8aP7ujoOp0kfez3UdfxzAgq2+VGbKkcoKqMLyjNUiZuHz9fVItB3h53JAE0DF5U6rFv63U7IwVlDqYnnECy1ydr6LBDpGy0Vt3H5vhgmmldyumuwac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Yonfa6r2; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-21625b4f978so29825ad.0
        for <linux-doc@vger.kernel.org>; Mon, 09 Dec 2024 19:31:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733801508; x=1734406308; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vv0YJOP4wsTr0yQs0O9EirzGuPC4EYUuQmTwZ8ZwYDs=;
        b=Yonfa6r2aTAA7K2Q3rzZ31HLSWfK+rUQeeWpm5Y+rsanQPK5pVWu78frOs/uaV7M1d
         0O9Sgmz/0HR5j7o0Dm+3vbiMldwpiOVHfRtF9W7NKKT2JPCKK6XJ6lgmKDuQ57mVNx0P
         ZL+BCVsNYZHT0Z7ruIl27v7c5wGEZiDnrTo1nGP0THLUH9sROLxgAr1ZwMXTt+TutR2g
         cF2o+NFblT7TutVJnLzY60BV7J+51pm3zH3B0h0kEpDXEBdyG+d6t4w+qv8Z8wcygVAX
         tjnLt0X/9TopjsP+gYdPGRbgyYri6+nSafDkWbsr8jUkspLwPalUsUYevUqvFdjtfFV8
         AaiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733801508; x=1734406308;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vv0YJOP4wsTr0yQs0O9EirzGuPC4EYUuQmTwZ8ZwYDs=;
        b=rdPwEC6z2M26if1vqiIfWBryIbqaDczIuecO3o3zQ3CVBR3rP3//GqJC0lZc9W4PSt
         wnRJJutEMbPvFmWR0ZafsKdIEaqy0vzormnH6zVgss1dGvFyHyb94CNQDLOOjU5nYqKu
         wo6GTZRIr7LXHeABMp25Rbyd42W8n/Y+oWMt2tZVGZP5SIbdVuIfV/X1peguOHvkb/+i
         jk8yvCd4a/3XRFe6axv9uEM5CljX5EDPS2DLkZLStOsAT5Cn24i3qaAc0JM7K/ecwjoH
         GToYopbd+POWLS1tGhch+pqQDDSoLaGaURF5STIzL+RUy6tDgmTS6xRkBlOkWyXLfBuA
         GecA==
X-Forwarded-Encrypted: i=1; AJvYcCUNW8a2Wcrzw06Er2oibxPScbbME2Q0/vQ0UQGyInnrKMfhL9V5j1AJeyfN0z27byIBALGnKAGSv80=@vger.kernel.org
X-Gm-Message-State: AOJu0YxfiPF9Hj3OZjgkqi8qvhEglZEHmCB58fr95It6ZvSQ5QTSVk02
	tGiVJCwGIEmz2X34jrttpMkrY0kc8crWn/bG5/HAyfvo4AFOPAiXp8TCueaVpw==
X-Gm-Gg: ASbGnctB4dDEYzO8xhVIEL+tWX/xlD5PItuzDDvpoO5k60ab7umcKjthYStRycs99MF
	eW77jTy8KOSugJG6k7tuh6tvn3YQxbjID3yNt/5NyVG1XAzXu9UHqoq17/i8DDZb1Ft/0jBt+wx
	SuVWf1vzIjvuWzVOjcFfLEKdvQSLUTSxOL1UNGe12Vgx5+bxwGKznRebow01okVz6oF9CXoYvuo
	EC6LiQzk+bJA99dEmsiT4Xktj7vOfDOdpy5ubkkCY8aCaWjGKcHTmMPrBwjD5ylkoB8KG6EHLyI
	l2ib1gOKqb4frWFQ
X-Google-Smtp-Source: AGHT+IH+pvo4/VQN7viU5wtrvbWZV7k0OuEnVi1lVzkq1rjMfGLod9qaEdLeCxJfDRPWaSCkHHj1EQ==
X-Received: by 2002:a17:903:2391:b0:215:44af:313b with SMTP id d9443c01a7336-216718a490bmr1533575ad.0.1733801506645;
        Mon, 09 Dec 2024 19:31:46 -0800 (PST)
Received: from google.com (226.75.127.34.bc.googleusercontent.com. [34.127.75.226])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-215f8ef9ef1sm79715295ad.159.2024.12.09.19.31.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2024 19:31:46 -0800 (PST)
Date: Tue, 10 Dec 2024 03:31:42 +0000
From: Carlos Llamas <cmllamas@google.com>
To: Li Li <dualli@chromium.org>
Cc: dualli@google.com, corbet@lwn.net, davem@davemloft.net,
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
	donald.hunter@gmail.com, gregkh@linuxfoundation.org,
	arve@android.com, tkjos@android.com, maco@android.com,
	joel@joelfernandes.org, brauner@kernel.org, surenb@google.com,
	arnd@arndb.de, masahiroy@kernel.org, bagasdotme@gmail.com,
	horms@kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, netdev@vger.kernel.org,
	hridya@google.com, smoreland@google.com, kernel-team@android.com
Subject: Re: [PATCH net-next v9 1/1] binder: report txn errors via generic
 netlink
Message-ID: <Z1e2Hn1ChSXCprwo@google.com>
References: <20241209192247.3371436-1-dualli@chromium.org>
 <20241209192247.3371436-2-dualli@chromium.org>
 <Z1eO-Nu0aowZnv6t@google.com>
 <CANBPYPgU9uL9jdxqsri=NwLTJcFpzdB313QsYjSQAuopRppTDw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANBPYPgU9uL9jdxqsri=NwLTJcFpzdB313QsYjSQAuopRppTDw@mail.gmail.com>

On Mon, Dec 09, 2024 at 05:26:14PM -0800, Li Li wrote:
> On Mon, Dec 9, 2024 at 4:44 PM Carlos Llamas <cmllamas@google.com> wrote:
> > > +
> > > +Usage example (user space pseudo code):
> > > +
> > > +::
> > > +
> > > +    // open netlink socket
> > > +    int fd = socket(AF_NETLINK, SOCK_RAW, NETLINK_GENERIC);
> > > +
> > > +    // bind netlink socket
> > > +    bind(fd, struct socketaddr);
> > > +
> > > +    // get the family id of the binder genl
> > > +    send(fd, CTRL_CMD_GETFAMILY, CTRL_ATTR_FAMILY_NAME,
> > > +            BINDER_GENL_FAMILY_NAME);
> >
> > ok, what is happening here? this is not a regular send(). Is this
> > somehow an overloaded send()? If so, I had a really hard time trying to
> > figuring that out so might be best to rename this.
> >
> 
> This pseudo code means a few attributes are sent by a single send().

Ok, sorry this broke my brain trying to make sense of the arguments to
send(). You imply that the nlmsghdr, genlmsghdr and so on need to be
populated accordingly with these arguments.

