Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B3B7C4E2DD6
	for <lists+linux-doc@lfdr.de>; Mon, 21 Mar 2022 17:25:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350273AbiCUQ0j (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 21 Mar 2022 12:26:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350481AbiCUQ0d (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 21 Mar 2022 12:26:33 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 8A7A3ECC72
        for <linux-doc@vger.kernel.org>; Mon, 21 Mar 2022 09:25:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1647879905;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=q2Bn3XlK8IT9FgRvenxkvdJ5nRvXCCC2R8osYi+f/mw=;
        b=INX8IwTlT2uUmRwLzXqRCViY41WkuLJ3RV7kXCMGGy3tgyvSjPTVf0oCxpVgPK12vt6X/V
        DrHaYDnvWpYAe4b/LD/S/U91Tasnol1AmRIhBw2qS8Mcw2uz+OYfyjzMVevQchZvWzh7z+
        cnsHVs9nPXYJWV9o+nF6ctf3y+Rk8Us=
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-67-6h39QIw3MQ6ScFC7ko6LGg-1; Mon, 21 Mar 2022 12:25:04 -0400
X-MC-Unique: 6h39QIw3MQ6ScFC7ko6LGg-1
Received: by mail-pg1-f200.google.com with SMTP id g9-20020a63be49000000b0038204e481caso6823899pgo.5
        for <linux-doc@vger.kernel.org>; Mon, 21 Mar 2022 09:25:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=q2Bn3XlK8IT9FgRvenxkvdJ5nRvXCCC2R8osYi+f/mw=;
        b=0OmPkbxYXErpCdjwYY7TnnhAvHbt91w8h9pnH1lSlEwNY8XOKiihM0QaumJt9/U5Ge
         O0WaI3ZHA8MXkx075W6//kxtjSKcXftPW7lVpd9e2JK+ItNoegboz/qaoZrqOiC6lQ22
         Sgutz7evyrmpeFiJDPL5E/A2jZT7guVgYWIuQ4Si/C0gbwXshAM720q6AF6nKeSmVTha
         Mmq+EOCd9VLmI7MKQ5+afWdf/JP/prLcVivabzlqF/dNLhdw/U6tn4jez87KXLDSvkXQ
         UOKk4svuPkJucoI9y0xgrMipJFmzcE5Fmf+/PJuAYmRMA3u2XisV8hb3Wno/N9KGQN9e
         92oQ==
X-Gm-Message-State: AOAM530iMa3kXbUifLNiw7MQ9zAgJFOmsnTdiZ9K4oImXTdSkFw9fT2b
        V1Iqw++F2oj2kvx8AYWFBDECI3dh2aWf6iFt4e7mY+c/aWgSl+AjjkW7qbsFCnQf6JCSGgnSToU
        jpKTGeA5s8v9xKcTmG/joXo/nPv62Fe16zMF7
X-Received: by 2002:a17:902:7141:b0:154:28e0:9720 with SMTP id u1-20020a170902714100b0015428e09720mr12811656plm.116.1647879902888;
        Mon, 21 Mar 2022 09:25:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx6Mo055/73jrKoU+/VyeNhPw3rNyZ7M1eakr9DM0Gnj53LRtbgBEuhDtkMJgiNdQ3nIMVZSHIcKlqVEcP03d4=
X-Received: by 2002:a17:902:7141:b0:154:28e0:9720 with SMTP id
 u1-20020a170902714100b0015428e09720mr12811623plm.116.1647879902525; Mon, 21
 Mar 2022 09:25:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220318161528.1531164-1-benjamin.tissoires@redhat.com>
 <20220318161528.1531164-13-benjamin.tissoires@redhat.com> <CAPhsuW5K9cdKCAf8mBu6zV2BSXjqdsB3bZ5i60=vfnHrYbh6vQ@mail.gmail.com>
In-Reply-To: <CAPhsuW5K9cdKCAf8mBu6zV2BSXjqdsB3bZ5i60=vfnHrYbh6vQ@mail.gmail.com>
From:   Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Mon, 21 Mar 2022 17:24:51 +0100
Message-ID: <CAO-hwJLsr+zEHj3Vf4dA+RtCJ6csbE_LmEgkQNCSWJCpxh4FUw@mail.gmail.com>
Subject: Re: [PATCH bpf-next v3 12/17] bpf/hid: add more HID helpers
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

On Fri, Mar 18, 2022 at 10:19 PM Song Liu <song@kernel.org> wrote:
>
> On Fri, Mar 18, 2022 at 9:18 AM Benjamin Tissoires
> <benjamin.tissoires@redhat.com> wrote:
> >
> > When we process an incoming HID report, it is common to have to account
> > for fields that are not aligned in the report. HID is using 2 helpers
> > hid_field_extract() and implement() to pick up any data at any offset
> > within the report.
> >
> > Export those 2 helpers in BPF programs so users can also rely on them.
> > The second net worth advantage of those helpers is that now we can
> > fetch data anywhere in the report without knowing at compile time the
> > location of it. The boundary checks are done in hid-bpf.c, to prevent
> > a memory leak.
> >
> > The third exported helper allows to communicate with the HID device.
> > We give a data buffer, and call either HID_GET_REPORT or HID_SET_REPORT
> > on the device.
> >
> > Signed-off-by: Benjamin Tissoires <benjamin.tissoires@redhat.com>
> >
> > ---
> >
> > changes in v3:
> > - renamed hid_{get|set}_data into hid_{get|set}_bits
> > - squashed with bpf/hid: add bpf_hid_raw_request helper function
> >
> > changes in v2:
> > - split the patch with libbpf and HID left outside.
> > ---
> >  include/linux/bpf-hid.h        |  6 +++
> >  include/uapi/linux/bpf.h       | 36 +++++++++++++++++
> >  kernel/bpf/hid.c               | 73 ++++++++++++++++++++++++++++++++++
> >  tools/include/uapi/linux/bpf.h | 36 +++++++++++++++++
> >  4 files changed, 151 insertions(+)
> >
> > diff --git a/include/linux/bpf-hid.h b/include/linux/bpf-hid.h
> > index 7f596554fe8c..82b7466b5008 100644
> > --- a/include/linux/bpf-hid.h
> > +++ b/include/linux/bpf-hid.h
> > @@ -102,6 +102,12 @@ struct bpf_hid_hooks {
> >         int (*pre_link_attach)(struct hid_device *hdev, enum bpf_hid_attach_type type);
> >         void (*post_link_attach)(struct hid_device *hdev, enum bpf_hid_attach_type type);
> >         void (*array_detach)(struct hid_device *hdev, enum bpf_hid_attach_type type);
> > +       int (*hid_get_bits)(struct hid_device *hdev, u8 *buf, size_t buf_size,
> > +                           u64 offset, u32 n, u32 *data);
> > +       int (*hid_set_bits)(struct hid_device *hdev, u8 *buf, size_t buf_size,
> > +                           u64 offset, u32 n, u32 data);
> > +       int (*hid_raw_request)(struct hid_device *hdev, u8 *buf, size_t size,
> > +                              u8 rtype, u8 reqtype);
> >  };
> >
> >  #ifdef CONFIG_BPF
> > diff --git a/include/uapi/linux/bpf.h b/include/uapi/linux/bpf.h
> > index 0e8438e93768..41ab1d068369 100644
> > --- a/include/uapi/linux/bpf.h
> > +++ b/include/uapi/linux/bpf.h
> > @@ -5155,6 +5155,39 @@ union bpf_attr {
> >   *             by a call to bpf_hid_discard;
> >   *     Return
> >   *             The pointer to the data. On error, a null value is returned.
> > + *
> > + * int bpf_hid_get_bits(void *ctx, u64 offset, u32 n, u32 *data)
> > + *     Description
> > + *             Get the data of size n (in bits) at the given offset (bits) in the
> > + *             ctx->event.data field and store it into data.
> > + *
> > + *             n must be less or equal than 32, and we can address with bit
> > + *             precision the value in the buffer. data must be a pointer
> > + *             to a u32.
> > + *     Return
> > + *             The length of data copied into data. On error, a negative value
> > + *             is returned.
> > + *
> > + * int bpf_hid_set_bits(void *ctx, u64 offset, u32 n, u32 data)
> > + *     Description
> > + *             Set the data of size n (in bits) at the given offset (bits) in the
> > + *             ctx->event.data field.
> > + *
> > + *             n must be less or equal than 32, and we can address with bit
> > + *             precision the value in the buffer.
> > + *     Return
> > + *             The length of data copied into ctx->event.data. On error, a negative
> > + *             value is returned.
> > + *
>  Please use annotations like *offset*.

Ack

>
> > + * int bpf_hid_raw_request(void *ctx, void *buf, u64 size, u8 report_type, u8 request_type)
> > + *     Description
> > + *             communicate with the HID device
> > + *
> > + *             report_type is one of HID_INPUT_REPORT, HID_OUTPUT_REPORT, HID_FEATURE_REPORT
> > + *             request_type is one of HID_REQ_SET_REPORT or HID_REQ_GET_REPORT
> > + *     Return
> > + *             0 on success.
> > + *             negative value on error.
> >   */
> >  #define __BPF_FUNC_MAPPER(FN)          \
> >         FN(unspec),                     \
> > @@ -5352,6 +5385,9 @@ union bpf_attr {
> >         FN(skb_set_tstamp),             \
> >         FN(ima_file_hash),              \
> >         FN(hid_get_data),               \
> > +       FN(hid_get_bits),               \
> > +       FN(hid_set_bits),               \
> > +       FN(hid_raw_request),            \
> >         /* */
> >
> >  /* integer value in 'imm' field of BPF_CALL instruction selects which helper
> > diff --git a/kernel/bpf/hid.c b/kernel/bpf/hid.c
> > index 2dfeaaa8a83f..30a62e8e0f0a 100644
> > --- a/kernel/bpf/hid.c
> > +++ b/kernel/bpf/hid.c
> > @@ -66,12 +66,85 @@ static const struct bpf_func_proto bpf_hid_get_data_proto = {
> >         .arg3_type = ARG_CONST_ALLOC_SIZE_OR_ZERO,
> >  };
> >
> > +BPF_CALL_4(bpf_hid_get_bits, struct hid_bpf_ctx_kern*, ctx, u64, offset, u32, n, u32*, data)
> > +{
> > +       if (!hid_hooks.hid_get_bits)
> > +               return -EOPNOTSUPP;
>
> Shall we also check offset and n are valid here?

I've decided to put these tests in the HID code. The argument being
that HID knows about the context and what is put where, when the BPF
part is just the stub.

[few seconds later]

... and probably not a good answer because the line below has
ctx->data and allocated_size.

I can easily change that in v4 (same for bpf_hid_set_bits).

>
> > +
> > +       return hid_hooks.hid_get_bits(ctx->hdev,
> > +                                     ctx->data,
> > +                                     ctx->allocated_size,
> > +                                     offset, n,
> > +                                     data);
> > +}
> > +
> > +static const struct bpf_func_proto bpf_hid_get_bits_proto = {
> > +       .func      = bpf_hid_get_bits,
> > +       .gpl_only  = true,
> > +       .ret_type  = RET_INTEGER,
> > +       .arg1_type = ARG_PTR_TO_CTX,
> > +       .arg2_type = ARG_ANYTHING,
> > +       .arg3_type = ARG_ANYTHING,
> > +       .arg4_type = ARG_PTR_TO_INT,
> > +};
> > +
> > +BPF_CALL_4(bpf_hid_set_bits, struct hid_bpf_ctx_kern*, ctx, u64, offset, u32, n, u32, data)
> > +{
> > +       if (!hid_hooks.hid_set_bits)
> > +               return -EOPNOTSUPP;
> > +
> > +       hid_hooks.hid_set_bits(ctx->hdev,
> > +                              ctx->data,
> > +                              ctx->allocated_size,
> > +                              offset, n,
> > +                              data);
> > +       return 0;
> > +}
> > +
> > +static const struct bpf_func_proto bpf_hid_set_bits_proto = {
> > +       .func      = bpf_hid_set_bits,
> > +       .gpl_only  = true,
> > +       .ret_type  = RET_INTEGER,
> > +       .arg1_type = ARG_PTR_TO_CTX,
> > +       .arg2_type = ARG_ANYTHING,
> > +       .arg3_type = ARG_ANYTHING,
> > +       .arg4_type = ARG_ANYTHING,
> > +};
> > +
> > +BPF_CALL_5(bpf_hid_raw_request, struct hid_bpf_ctx_kern*, ctx, void*, buf, u64, size,
> > +          u8, report_type, u8, request_type)
> > +{
> > +       if (!hid_hooks.hid_raw_request)
> > +               return -EOPNOTSUPP;
> > +
> > +       return hid_hooks.hid_raw_request(ctx->hdev, buf, size, report_type, request_type);
> > +}
> > +
> > +static const struct bpf_func_proto bpf_hid_raw_request_proto = {
> > +       .func      = bpf_hid_raw_request,
> > +       .gpl_only  = true, /* hid_raw_request is EXPORT_SYMBOL_GPL */
> > +       .ret_type  = RET_INTEGER,
> > +       .arg1_type = ARG_PTR_TO_CTX,
> > +       .arg2_type = ARG_PTR_TO_MEM,
> > +       .arg3_type = ARG_CONST_SIZE_OR_ZERO,
> > +       .arg4_type = ARG_ANYTHING,
> > +       .arg5_type = ARG_ANYTHING,
> > +};
> > +
> >  static const struct bpf_func_proto *
> >  hid_func_proto(enum bpf_func_id func_id, const struct bpf_prog *prog)
> >  {
> >         switch (func_id) {
> >         case BPF_FUNC_hid_get_data:
> >                 return &bpf_hid_get_data_proto;
> > +       case BPF_FUNC_hid_get_bits:
> > +               return &bpf_hid_get_bits_proto;
> > +       case BPF_FUNC_hid_set_bits:
> > +               return &bpf_hid_set_bits_proto;
> > +       case BPF_FUNC_hid_raw_request:
> > +               if (prog->expected_attach_type != BPF_HID_DEVICE_EVENT)
> > +                       return &bpf_hid_raw_request_proto;
> > +               return NULL;
> >         default:
> >                 return bpf_base_func_proto(func_id);
> >         }
> > diff --git a/tools/include/uapi/linux/bpf.h b/tools/include/uapi/linux/bpf.h
> > index 0e8438e93768..41ab1d068369 100644
> > --- a/tools/include/uapi/linux/bpf.h
> > +++ b/tools/include/uapi/linux/bpf.h
> > @@ -5155,6 +5155,39 @@ union bpf_attr {
> >   *             by a call to bpf_hid_discard;
> >   *     Return
> >   *             The pointer to the data. On error, a null value is returned.
> > + *
> > + * int bpf_hid_get_bits(void *ctx, u64 offset, u32 n, u32 *data)
> > + *     Description
> > + *             Get the data of size n (in bits) at the given offset (bits) in the
> > + *             ctx->event.data field and store it into data.
> > + *
> > + *             n must be less or equal than 32, and we can address with bit
> > + *             precision the value in the buffer. data must be a pointer
> > + *             to a u32.
> > + *     Return
> > + *             The length of data copied into data. On error, a negative value
> > + *             is returned.
> > + *
> > + * int bpf_hid_set_bits(void *ctx, u64 offset, u32 n, u32 data)
> > + *     Description
> > + *             Set the data of size n (in bits) at the given offset (bits) in the
> > + *             ctx->event.data field.
> > + *
> > + *             n must be less or equal than 32, and we can address with bit
> > + *             precision the value in the buffer.
> > + *     Return
> > + *             The length of data copied into ctx->event.data. On error, a negative
> > + *             value is returned.
> > + *
> > + * int bpf_hid_raw_request(void *ctx, void *buf, u64 size, u8 report_type, u8 request_type)
> > + *     Description
> > + *             communicate with the HID device
> > + *
> > + *             report_type is one of HID_INPUT_REPORT, HID_OUTPUT_REPORT, HID_FEATURE_REPORT
> > + *             request_type is one of HID_REQ_SET_REPORT or HID_REQ_GET_REPORT
> > + *     Return
> > + *             0 on success.
> > + *             negative value on error.
> >   */
> >  #define __BPF_FUNC_MAPPER(FN)          \
> >         FN(unspec),                     \
> > @@ -5352,6 +5385,9 @@ union bpf_attr {
> >         FN(skb_set_tstamp),             \
> >         FN(ima_file_hash),              \
> >         FN(hid_get_data),               \
> > +       FN(hid_get_bits),               \
> > +       FN(hid_set_bits),               \
> > +       FN(hid_raw_request),            \
> >         /* */
> >
> >  /* integer value in 'imm' field of BPF_CALL instruction selects which helper
> > --
> > 2.35.1
> >
>

