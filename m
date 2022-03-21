Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 42B604E2DC1
	for <lists+linux-doc@lfdr.de>; Mon, 21 Mar 2022 17:22:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351042AbiCUQWU (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 21 Mar 2022 12:22:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351030AbiCUQWI (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 21 Mar 2022 12:22:08 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 7B56BAA02F
        for <linux-doc@vger.kernel.org>; Mon, 21 Mar 2022 09:20:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1647879641;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=pbOdQocvJIgIYNAU3dOVs2DjR6X7k4MYj/M90iJjWXY=;
        b=B4/SLeCedO2YddgJNKp/ARinWHpAgB8r2vU/lBBt4LiPOOY8yRWjel3zL3WwRuY6td6H21
        rW2/+xI+CPHikAG1l/Nan+civeYMGOB9VQSzfP3IO0+HxYCVwZqyLaSqsaDqq5SgI+Q2D8
        AuiY1q04lbacFTBei4KcCdy8dKQdyrc=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-427-B3RH1IRcPXygaYgJ3aUQmQ-1; Mon, 21 Mar 2022 12:20:37 -0400
X-MC-Unique: B3RH1IRcPXygaYgJ3aUQmQ-1
Received: by mail-pl1-f197.google.com with SMTP id q11-20020a170902c9cb00b001546680ee18so971000pld.7
        for <linux-doc@vger.kernel.org>; Mon, 21 Mar 2022 09:20:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pbOdQocvJIgIYNAU3dOVs2DjR6X7k4MYj/M90iJjWXY=;
        b=8FuzQVdg9S1Bub2wv9aWk0NhCF1Ikl0ZvaI9YN6QoxpmDjzjNyOCI5FtrtHg88yu+h
         VRCIdwroypULN/1UtYJMTGrjIejXSLPHzZTCslhruRF/M6C3v7MqFEvSAKradzEn9dgZ
         kZ3Cs2mdvNYCbxg8FkkJolQEXECUlSacjJFZaFFT24xouCYhidsmFsCP0T8OGQrPZ/ZR
         0lxGZXWnzTI4z6jlUwFjdZc8cdpbaJZZU9ilW0Yh4kMg54YzlnTa2k2wRx+NPiMRlCWj
         bQfYezWi7DE/bs37DCaOfCLHf2BtEDeFKwhxn05FLeHVug6yM/KZicp69klcJtYAmRtm
         oYpA==
X-Gm-Message-State: AOAM533U2v6XcQiK8uvwbLKWddi2WmRGTfuNToavFLuAXpjJrmZ9dPZI
        3XBYzHzz+7yenWN5H4vBoTZ5M3izzNUnjV0v0miU+fPJata36bUO5njiFaCTVbJNcJG2ahGS8un
        MansIi4uv8E7f0F42kALjyxoSJKur3LqGx1cF
X-Received: by 2002:a05:6a00:2182:b0:4fa:6d20:d95d with SMTP id h2-20020a056a00218200b004fa6d20d95dmr18135931pfi.83.1647879635814;
        Mon, 21 Mar 2022 09:20:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzjF27dG7tlIwqHRmGo/L1Pqa+cqzwxC/hE5t254t/WUOFy/f2ich/A4jW9Ku25eWsmp14ZXqbMpd+Hu20Rbjo=
X-Received: by 2002:a05:6a00:2182:b0:4fa:6d20:d95d with SMTP id
 h2-20020a056a00218200b004fa6d20d95dmr18135864pfi.83.1647879635332; Mon, 21
 Mar 2022 09:20:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220318161528.1531164-1-benjamin.tissoires@redhat.com>
 <20220318161528.1531164-7-benjamin.tissoires@redhat.com> <CAPhsuW64x8_m1pNN9gC8LA8ajAmy+5O3y+iOaC7ixSXU=J624Q@mail.gmail.com>
In-Reply-To: <CAPhsuW64x8_m1pNN9gC8LA8ajAmy+5O3y+iOaC7ixSXU=J624Q@mail.gmail.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Mon, 21 Mar 2022 17:20:24 +0100
Message-ID: <CAO-hwJL+A5hqzGBCVCtp4diuM-_Aii+HAKNfz5oMZBTHCQrEkQ@mail.gmail.com>
Subject: Re: [PATCH bpf-next v3 06/17] HID: allow to change the report
 descriptor from an eBPF program
To:     Song Liu <song@kernel.org>
Cc:     Greg KH <gregkh@linuxfoundation.org>,
        Jiri Kosina <jikos@kernel.org>,
        Alexei Starovoitov <ast@kernel.org>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Andrii Nakryiko <andrii@kernel.org>,
        Martin KaFai Lau <kafai@fb.com>,
        Song Liu <songliubraving@fb.com>, Yonghong Song <yhs@fb.com>,
        John Fastabend <john.fastabend@gmail.com>,
        KP Singh <kpsingh@kernel.org>, Shuah Khan <shuah@kernel.org>,
        Dave Marchevsky <davemarchevsky@fb.com>,
        Joe Stringer <joe@cilium.io>, Jonathan Corbet <corbet@lwn.net>,
        Tero Kristo <tero.kristo@linux.intel.com>,
        open list <linux-kernel@vger.kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        Networking <netdev@vger.kernel.org>, bpf <bpf@vger.kernel.org>,
        linux-kselftest@vger.kernel.org,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Mar 18, 2022 at 10:10 PM Song Liu <song@kernel.org> wrote:
>
> On Fri, Mar 18, 2022 at 9:17 AM Benjamin Tissoires
> <benjamin.tissoires@redhat.com> wrote:
> >
> > Make use of BPF_HID_ATTACH_RDESC_FIXUP so we can trigger an rdesc fixup
> > in the bpf world.
> >
> > Whenever the program gets attached/detached, the device is reconnected
> > meaning that userspace will see it disappearing and reappearing with
> > the new report descriptor.
> >
> > Signed-off-by: Benjamin Tissoires <benjamin.tissoires@redhat.com>
> >
> > ---
> >
> > changes in v3:
> > - ensure the ctx.size is properly bounded by allocated size
> > - s/link_attached/post_link_attach/
> > - removed the switch statement with only one case
> >
> > changes in v2:
> > - split the series by bpf/libbpf/hid/selftests and samples
> > ---
> >  drivers/hid/hid-bpf.c  | 62 ++++++++++++++++++++++++++++++++++++++++++
> >  drivers/hid/hid-core.c |  3 +-
> >  include/linux/hid.h    |  6 ++++
> >  3 files changed, 70 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/hid/hid-bpf.c b/drivers/hid/hid-bpf.c
> > index 5060ebcb9979..45c87ff47324 100644
> > --- a/drivers/hid/hid-bpf.c
> > +++ b/drivers/hid/hid-bpf.c
> > @@ -50,6 +50,14 @@ static struct hid_device *hid_bpf_fd_to_hdev(int fd)
> >         return hdev;
> >  }
> >
> > +static int hid_reconnect(struct hid_device *hdev)
> > +{
> > +       if (!test_and_set_bit(ffs(HID_STAT_REPROBED), &hdev->status))
> > +               return device_reprobe(&hdev->dev);
> > +
> > +       return 0;
> > +}
> > +
> >  static int hid_bpf_pre_link_attach(struct hid_device *hdev, enum bpf_hid_attach_type type)
> >  {
> >         int err = 0;
> > @@ -92,6 +100,12 @@ static int hid_bpf_pre_link_attach(struct hid_device *hdev, enum bpf_hid_attach_
> >         return err;
> >  }
> >
> > +static void hid_bpf_post_link_attach(struct hid_device *hdev, enum bpf_hid_attach_type type)
> > +{
> > +       if (type == BPF_HID_ATTACH_RDESC_FIXUP)
> > +               hid_reconnect(hdev);
> > +}
> > +
> >  static void hid_bpf_array_detach(struct hid_device *hdev, enum bpf_hid_attach_type type)
> >  {
> >         switch (type) {
> > @@ -99,6 +113,9 @@ static void hid_bpf_array_detach(struct hid_device *hdev, enum bpf_hid_attach_ty
> >                 kfree(hdev->bpf.device_data);
> >                 hdev->bpf.device_data = NULL;
> >                 break;
> > +       case BPF_HID_ATTACH_RDESC_FIXUP:
> > +               hid_reconnect(hdev);
> > +               break;
> >         default:
> >                 /* do nothing */
> >                 break;
> > @@ -116,6 +133,9 @@ static int hid_bpf_run_progs(struct hid_device *hdev, struct hid_bpf_ctx_kern *c
> >         case HID_BPF_DEVICE_EVENT:
> >                 type = BPF_HID_ATTACH_DEVICE_EVENT;
> >                 break;
> > +       case HID_BPF_RDESC_FIXUP:
> > +               type = BPF_HID_ATTACH_RDESC_FIXUP;
> > +               break;
> >         default:
> >                 return -EINVAL;
> >         }
> > @@ -155,11 +175,53 @@ u8 *hid_bpf_raw_event(struct hid_device *hdev, u8 *data, int *size)
> >         return ctx.data;
> >  }
> >
> > +u8 *hid_bpf_report_fixup(struct hid_device *hdev, u8 *rdesc, unsigned int *size)
> > +{
> > +       int ret;
> > +       struct hid_bpf_ctx_kern ctx = {
> > +               .type = HID_BPF_RDESC_FIXUP,
> > +               .hdev = hdev,
> > +               .size = *size,
> > +       };
> > +
> > +       if (bpf_hid_link_empty(&hdev->bpf, BPF_HID_ATTACH_RDESC_FIXUP))
>
> Do we need to lock bpf_hid_mutex before calling bpf_hid_link_empty()?
> (or maybe we
> already did?)

The mutex is not locked before this call, indeed.

However, bpf_hid_link_empty() is an inlined function that just calls
in the end list_empty(). Given that all the list heads are created
just once for the entire life of the HID device, I *think* this is
thread safe and does not require mutex locking.

(I might be wrong)

So when first plugging in the device, if there is a fighting process
that attempts to add a program, if the program managed to insert
itself before we enter this code, then the list won't be empty and we
will execute BPF_PROG_RUN_ARRAY(), and if not, well, we ignore it and
wait for reconnect().

But now I am starting to wonder if I need to also protect
BPF_PROG_RUN_ARRAY() under bpf_hid_mutex...

Cheers,
Benjamin

>
>
> > +               goto ignore_bpf;
> > +
> > +       ctx.data = kmemdup(rdesc, HID_MAX_DESCRIPTOR_SIZE, GFP_KERNEL);
> > +       if (!ctx.data)
> > +               goto ignore_bpf;
> > +
> > +       ctx.allocated_size = HID_MAX_DESCRIPTOR_SIZE;
> > +
> > +       ret = hid_bpf_run_progs(hdev, &ctx);
> > +       if (ret)
> > +               goto ignore_bpf;
> > +
> > +       if (ctx.size > ctx.allocated_size)
> > +               goto ignore_bpf;
> > +
> > +       *size = ctx.size;
> > +
> > +       if (*size) {
> > +               rdesc = krealloc(ctx.data, *size, GFP_KERNEL);
> > +       } else {
> > +               rdesc = NULL;
> > +               kfree(ctx.data);
> > +       }
> > +
> > +       return rdesc;
> > +
> > + ignore_bpf:
> > +       kfree(ctx.data);
> > +       return kmemdup(rdesc, *size, GFP_KERNEL);
> > +}
> > +
> >  int __init hid_bpf_module_init(void)
> >  {
> >         struct bpf_hid_hooks hooks = {
> >                 .hdev_from_fd = hid_bpf_fd_to_hdev,
> >                 .pre_link_attach = hid_bpf_pre_link_attach,
> > +               .post_link_attach = hid_bpf_post_link_attach,
> >                 .array_detach = hid_bpf_array_detach,
> >         };
> >
> > diff --git a/drivers/hid/hid-core.c b/drivers/hid/hid-core.c
> > index 937fab7eb9c6..3182c39db006 100644
> > --- a/drivers/hid/hid-core.c
> > +++ b/drivers/hid/hid-core.c
> > @@ -1213,7 +1213,8 @@ int hid_open_report(struct hid_device *device)
> >                 return -ENODEV;
> >         size = device->dev_rsize;
> >
> > -       buf = kmemdup(start, size, GFP_KERNEL);
> > +       /* hid_bpf_report_fixup() ensures we work on a copy of rdesc */
> > +       buf = hid_bpf_report_fixup(device, start, &size);
> >         if (buf == NULL)
> >                 return -ENOMEM;
> >
> > diff --git a/include/linux/hid.h b/include/linux/hid.h
> > index 8fd79011f461..66d949d10b78 100644
> > --- a/include/linux/hid.h
> > +++ b/include/linux/hid.h
> > @@ -1213,10 +1213,16 @@ do {                                                                    \
> >
> >  #ifdef CONFIG_BPF
> >  u8 *hid_bpf_raw_event(struct hid_device *hdev, u8 *rd, int *size);
> > +u8 *hid_bpf_report_fixup(struct hid_device *hdev, u8 *rdesc, unsigned int *size);
> >  int hid_bpf_module_init(void);
> >  void hid_bpf_module_exit(void);
> >  #else
> >  static inline u8 *hid_bpf_raw_event(struct hid_device *hdev, u8 *rd, int *size) { return rd; }
> > +static inline u8 *hid_bpf_report_fixup(struct hid_device *hdev, u8 *rdesc,
> > +                                      unsigned int *size)
> > +{
> > +       return kmemdup(rdesc, *size, GFP_KERNEL);
> > +}
> >  static inline int hid_bpf_module_init(void) { return 0; }
> >  static inline void hid_bpf_module_exit(void) {}
> >  #endif
> > --
> > 2.35.1
> >
>

