Return-Path: <linux-doc+bounces-38753-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 98AC9A3CEE4
	for <lists+linux-doc@lfdr.de>; Thu, 20 Feb 2025 02:47:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 80A66189B1CC
	for <lists+linux-doc@lfdr.de>; Thu, 20 Feb 2025 01:47:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 109DD1CAA6F;
	Thu, 20 Feb 2025 01:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZHvHWwyl"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED3BA1B87E9
	for <linux-doc@vger.kernel.org>; Thu, 20 Feb 2025 01:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740016013; cv=none; b=QTVUbvVbEuZZE615iqpEgD7+da+fEi9aE03UoJ6ZlYALC3ycRGpgGfhVBJEf4I+NK6hmdAsL+oeCmVz7p/TtSewkiYFNpuO8kT5pOuA//Z7ZjIHytihspTe84+U1UqtwfbfR4LALehiH6Hw1uXcY3ep+DPczckPORjHDmzdSawQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740016013; c=relaxed/simple;
	bh=arHaMf1VlgzmwsFpfVOXP4yaHpMS0ZNgicYCaJisT68=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ompLUkODb2ciEQxo1e23bUXQ6Rj1ogy0EvB8n87340GhY7JRIQf25oE1YRfHUW7YdsL5YGpvSVdkhYzKvHPo9SBKpVzdozyyIeEWbeO+oUhuxFM855ZsquUqO1sFpIo05C5s92pNx1Qrqb8FxS4EFAkacLcDXq/iZjBBMFGyKY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ZHvHWwyl; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-22117c396baso52965ad.1
        for <linux-doc@vger.kernel.org>; Wed, 19 Feb 2025 17:46:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740016010; x=1740620810; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=arHaMf1VlgzmwsFpfVOXP4yaHpMS0ZNgicYCaJisT68=;
        b=ZHvHWwylli4v/kwyvblumZWi5uwyL7nVsf7ALukl/Rg1rEXCl+8VSd/u+0aXK1pVZj
         sxqo8VEF3MrLM2h+xY8vzuZdbgt/1N6M/qODIzHqIYlzB29biHRT5jRRWRgoJNPhRnmY
         3GJWi904l/R987K4DBzL01g1Ku/kTbrH8nNGBAsjdjsIRZ/n8rGWRRJ1OQKLLO1KY9cF
         5Ak0gfM7R9HeTBpn7cNzvLISV2ujINdHHTAEMlVxQk9p99xnJXrCAThCovb4n/dJxckY
         mEfqrVwgjHrqoSswuivNplzZFkOE+eN5HPDNOFMI6JRMA2s90pQzb9i6mTVDqOgs5HT0
         qLIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740016010; x=1740620810;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=arHaMf1VlgzmwsFpfVOXP4yaHpMS0ZNgicYCaJisT68=;
        b=m+LpmUz9YPl1aM1KDkMv7jNkxnoShocY82fsFZObE5XghNki0xQilosFVjqXHGOYNj
         ll/f0/VYROKIc7P4RcwOoFI/E33QiwGqvE/bmxJp8g+YxAwtsFuHCEgfgbrCmppwdSt6
         yFV4WxX9jeCHeVbA1HziDrTVTKjvtEhZSSwUnuIeeZl2Yrdb3cB40s9qme9RBxxkEhmb
         NtrVX9Vf7gYIuUgVnAchdXZfXf4krNT9jSjkTi97Cw5Xch4jD3y0k/1v/lYPd98Ghv10
         amGaLq+9cPFUloMc9IQ2aakbCobRle/Qj3hbE085IdmdTw+WzZ8HxIj7HcU3zKYHxKky
         LWbQ==
X-Forwarded-Encrypted: i=1; AJvYcCXBSopkdB1Ej54unR+pqW72z51hqgyi805u1Z5uL1UtT0BWG/M61XzMXRIFCjnojFsCjhyOu6kSgME=@vger.kernel.org
X-Gm-Message-State: AOJu0YxjMTlJCkm57jMJIaWpzohEtQWcDO3qcWJV4JgA9U6suGYucQ99
	XNCqqcPFFp7qy5XdeOznvG+v3m/uGwrg5uKPuUt7SInMlRSKfDYCdwGSVAn89RXbhl+TFvO+Ki5
	9NzTMkc1yTtoqk62Ft8DWY46X+Nb3aWvo4n90
X-Gm-Gg: ASbGncvFeyQ3OovkwjzMLSDItGXGBIBKGiZTnYH9vZtNLZO8zrVpETqGia8sHztarUK
	Ooidpk3NMAm4FYH6/Ba1IBNnJedb76d0hdYpgTEUyfpN//YiEG9hWBq15gWP2pUW3HOmOcnP0
X-Google-Smtp-Source: AGHT+IEz/wy+PbvayGyl/ZC2Oa91Z8b/neItdKm+4+1vyV76jCH3mzoPtf/GRrixk+9Ls+oK+3gmWERSJ245t2qC3RY=
X-Received: by 2002:a17:903:19ef:b0:215:f0c6:4dbf with SMTP id
 d9443c01a7336-2218dd576f9mr1423265ad.14.1740016009988; Wed, 19 Feb 2025
 17:46:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250203223916.1064540-1-almasrymina@google.com>
 <20250203223916.1064540-6-almasrymina@google.com> <abc22620-d509-4b12-80ac-0c36b08b36d9@gmail.com>
 <CAHS8izNOqaFe_40gFh09vdBz6-deWdeGu9Aky-e7E+Wu2qtfdw@mail.gmail.com>
 <28343e83-6d93-4002-a691-f8273d4d24a8@gmail.com> <CAHS8izOE-JzMszieHEXtYBs7_6D-ngVx2kJyMwp8eCWLK-c0cQ@mail.gmail.com>
 <9210a12c-9adb-46ba-b92c-90fd07e1980f@gmail.com> <CAHS8izPHtk5x-W05_svxU53X-V4+++PiYErCgfr-3iDGgEaUig@mail.gmail.com>
 <4cdfaff8-0623-4d3a-9204-5165ccbb84db@gmail.com>
In-Reply-To: <4cdfaff8-0623-4d3a-9204-5165ccbb84db@gmail.com>
From: Mina Almasry <almasrymina@google.com>
Date: Wed, 19 Feb 2025 17:46:37 -0800
X-Gm-Features: AWEUYZkdYTArMvyspFK_MTvc6qB9T7tm4wBNfrCPa7PpZJsZ-6EA0AUf_amyQgU
Message-ID: <CAHS8izNHT_VjztrDk6t-OJoX=zB3vV81w2CYZTKA1yGB06tY-Q@mail.gmail.com>
Subject: Re: [PATCH net-next v3 5/6] net: devmem: Implement TX path
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, kvm@vger.kernel.org, 
	virtualization@lists.linux.dev, linux-kselftest@vger.kernel.org, 
	Donald Hunter <donald.hunter@gmail.com>, Jakub Kicinski <kuba@kernel.org>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, Neal Cardwell <ncardwell@google.com>, 
	David Ahern <dsahern@kernel.org>, "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, 
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>, =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>, 
	Stefan Hajnoczi <stefanha@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>, Shuah Khan <shuah@kernel.org>, 
	sdf@fomichev.me, dw@davidwei.uk, Jamal Hadi Salim <jhs@mojatatu.com>, 
	Victor Nogueira <victor@mojatatu.com>, Pedro Tammela <pctammela@mojatatu.com>, 
	Samiullah Khawaja <skhawaja@google.com>, Kaiyuan Zhang <kaiyuanz@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 19, 2025 at 2:40=E2=80=AFPM Pavel Begunkov <asml.silence@gmail.=
com> wrote:
>
> On 2/17/25 23:26, Mina Almasry wrote:
> > On Thu, Feb 13, 2025 at 5:17=E2=80=AFAM Pavel Begunkov <asml.silence@gm=
ail.com> wrote:
> ...
> >>>>> It's asserting that sizeof(ubuf_info_msgzc) <=3D sizeof(skb->cb), a=
nd
> >>>>> I'm guessing increasing skb->cb size is not really the way to go.
> >>>>>
> >>>>> What I may be able to do here is stash the binding somewhere in
> >>>>> ubuf_info_msgzc via union with fields we don't need for devmem, and=
/or
> >>>>
> >>>> It doesn't need to account the memory against the user, and you
> >>>> actually don't want that because dmabuf should take care of that.
> >>>> So, it should be fine to reuse ->mmp.
> >>>>
> >>>> It's also not a real sk_buff, so maybe maintainers wouldn't mind
> >>>> reusing some more space out of it, if that would even be needed.
> >>>>
> >>>
> >>> netmem skb are real sk_buff, with the modification that frags are not
> >>
> >> We were discussing ubuf_info allocation, take a look at
> >> msg_zerocopy_alloc(), it has nothing to do with netmems and all that.
> >>
> >
> > Yes. My response was regarding the suggestion that we can use space in
> > devmem skbs however we want though.
>
> Well, at least I didn't suggest that, assuming "devmem skbs" are skbs
> filled with devmem frags. I think the confusion here is thinking
> that skb->cb you mentioned above is about "devmem skbs", while it's
> special skbs without data used only to piggy back ubuf allocation.

Ah, I see. I still don't see how we can just increase the size of
skb->cb when it's shared between these special skbs and regular skbs.

> Functionally speaking, it'd be perfectly fine to get rid of the
> warning and allocate it with kmalloc().
>

More suggestions to refactor unrelated things to force through a
msg->sg_from_iter approach.

> ...
> >>> But MSG_ZEROCOPY doesn't set msg->msg_ubuf. And not setting
> >>> msg->msg_ubuf fails to trigger msg->sg_from_iter altogether.
> >>>
> >>> And also currently sg_from_iter isn't set up to take in a ubuf_info.
> >>> We'd need that if we stash the binding in the ubuf_info.
> >>
> >> https://github.com/isilence/linux.git sg-iter-ops
> >>
> >> I have old patches for all of that, they even rebased cleanly. That
> >> should do it for you, and I need to send then regardless of devmem.
> >>
> >>
> >
> > These patches help a bit, but do not make any meaningful dent in
> > addressing the concern I have in the earlier emails.
> >
> > The concern is that we're piggybacking devmem TX on MSG_ZEROCOPY, and
> > currently the MSG_ZEROCOPY code carefully avoids any code paths
> > setting msg->[sg_from_iter|msg_ubuf].
>
> Fwiw, with that branch you don't need ->msg_ubuf at all, just pass
> it as an argument from tcp_sendmsg_locked() as usual, and
> ->sg_from_iter is gone from there as well.
>
> > If we want devmem to reuse both the MSG_ZEROCOPY mechanisms and the
> > msg->[sg_from_iter|ubuf_info] mechanism, I have to dissect the
> > MSG_ZEROCOPY code carefully so that it works with and without
> > setting msg->[ubuf_info|msg->sg_from_iter]. Having gone through this
> > rabbit hole so far I see that it complicates the implementation and
> > adds more checks to the fast MSG_ZEROCOPY paths.
>
> If you've already done, maybe you can post it as a draft? At least
> it'll be obvious why you say it's more complicated.
>

I don't have anything worth sharing. Just went down this rabbit hole
and saw a bunch of MSG_ZEROCOPY checks (!msg->msg_ubuf checks around
MSG_ZEROCOPY code) and restrictions (skb->cb size) need to be
addressed and checks to be added. From this thread you seem to be
suggesting more changes to force in a msg->sg_from_iter approach
adding to the complications.

> > The complication could be worth it if there was some upside, but I
> > don't see one tbh. Passing the binding down to
> > zerocopy_fill_skb_from_devmem seems like a better approach to my eye
> > so far
>
> The upside is that 1) you currently you add overhead to common
> path (incl copy),

You mean the unlikely() check for devmem before delegating to
skb_zerocopy_fill_from_devmem? Should be minimal.

> 2) passing it down through all the function also
> have overhead to the zerocopy and MSG_ZEROCOPY path, which I'd
> assume is comparable to those extra checks you have.

Complicating/refactoring existing code for devmem TCP to force in a
msg->sg_from_iter and save 1 arg passed down a couple of functions
doesn't seem like a good tradeoff IMO.

> 3) tcp would
> need to know about devmem tcp and its bindings, while it all could
> be in one spot under the MSG_ZEROCOPY check.

I don't see why this is binding to tcp somehow. If anything it makes
the devmem TX implementation follow closely MSG_ZEROCOPY, and existing
MSG_ZEROCOPY code would be easily extended for devmem TX without
having to also carry refactors to migrate to msg->sg_from_iter
approach (just grab the binding and pass it to
skb_zerocopy_iter_stream).

> 4) When you'd want
> another protocol to support that, instead of a simple
>
> ubuf =3D get_devmem_ubuf();
>
> You'd need to plumb binding passing through the stack there as
> well.
>

Similar to above, I think this approach will actually extend easier to
any protocol already using MSG_ZEROCOPY, because we follow that
closely instead of requiring refactors to force msg->sg_from_iter
approach.


> 5) And keeping it in one place makes it easier to keep around.
>
> I just don't see why it'd be complicated, but maybe I miss
> something, which is why a draft prototype would explain it
> better than any words.
>
> > I'm afraid I'm going to table this for now. If there is overwhelming
> > consensus that msg->sg_from_iter is the right approach here I will
> > revisit, but it seems to me to complicate code without a significant
> > upside.
>
> --
> Pavel Begunkov
>


--
Thanks,
Mina

