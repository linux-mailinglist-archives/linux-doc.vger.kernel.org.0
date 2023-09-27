Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A2B7E7AFB22
	for <lists+linux-doc@lfdr.de>; Wed, 27 Sep 2023 08:33:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229800AbjI0GdW (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Wed, 27 Sep 2023 02:33:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229634AbjI0GdT (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 27 Sep 2023 02:33:19 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCB6AD6
        for <linux-doc@vger.kernel.org>; Tue, 26 Sep 2023 23:33:16 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-9b1ebc80d0aso1000172266b.0
        for <linux-doc@vger.kernel.org>; Tue, 26 Sep 2023 23:33:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sigma-star.at; s=google; t=1695796395; x=1696401195; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T708F5QyhTdSRBo0vkbwGJcJTd2q8jjeOwZduLQ6af4=;
        b=OxYooSxZ/WhtvBZWVgJBfx9u+BDCWlewHJqOvmrZLqfysuCUmFsca26/TBKNArOmdI
         9JLqTqlteiqUa7M/Qfg24OvO0TW5UaYES4k0W+XhWGhXSYEcPgOdjKIhBS+IEB/Uhtdk
         +O2KyOkb1YGGLJ8KaSPIPO7WjSmmuV8IqVc5C5yPXQFi1fJEysMffGNcKdV+FfSmBAzQ
         we+lZh503R05Azi+Kigz86jx/u8YWmpH1odxhZGjYxHSPeH7uGh+m6n+JM4+ZAvxJghQ
         Fm9JOd/Kktw/EpKCQCOrVVTGFgwXWDXHYzcmaPQbdyFIG5A1dQHVFDb/HztsFUfbkyBx
         pR1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695796395; x=1696401195;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T708F5QyhTdSRBo0vkbwGJcJTd2q8jjeOwZduLQ6af4=;
        b=PKtfhdq0T3d3svcUiGt+XGQ5b0voxHQGUSz2wmhhKfNLllGkAoVz9x0iayw8FNcUPf
         JItaMYDNrGq57pz8Cg5uiNKqRUTC4+XSPxPkD+7i3sWKRJXOGsVsMc1YdoVOOiiI5Vga
         +j7NBYJ9iVQNpZorJ+yqekCx+S4DMQ+qiv35KSQKuD9vwUvPcfmOZmns8nWCKx5QYpoo
         9vaMaHO9cT3zpjUccQg84ua0pES8yDgcH6EVw9X/WnDVrg9BDKj6U8QM88lfV5Hu2Xqs
         NdVBA2Xa0DQzBm2odI+wDCl/jyuIRCSbI5seoZCGAWPJXBo/7Fq++V/pkX4BQBETU5PA
         5KGQ==
X-Gm-Message-State: AOJu0YxhrvnoA8G7XAXAhkpFAOjzFFDDNGzZDmNnE7YBtzGlSjZD01C0
        QgcPBJnoEizrkxs7n0U+LP71Zg==
X-Google-Smtp-Source: AGHT+IEOdVKh3lqrnVsm5wgtPLXy5Xv/FFQE8Bm/j/IIYkd2ZH2UDUPzX449yWw9sMd34VT6PLwL3g==
X-Received: by 2002:a17:906:5390:b0:9aa:25f5:8d95 with SMTP id g16-20020a170906539000b009aa25f58d95mr858687ejo.59.1695796394622;
        Tue, 26 Sep 2023 23:33:14 -0700 (PDT)
Received: from smtpclient.apple (213-225-13-130.nat.highway.a1.net. [213.225.13.130])
        by smtp.gmail.com with ESMTPSA id p7-20020a170906140700b009829d2e892csm8988478ejc.15.2023.09.26.23.33.12
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 26 Sep 2023 23:33:14 -0700 (PDT)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.700.6\))
Subject: Re: [PATCH v3 2/3] KEYS: trusted: Introduce support for NXP DCP-based
 trusted keys
From:   David Gstir <david@sigma-star.at>
In-Reply-To: <CVS3WN3Q04XY.B40S4RBH9QM7@suppilovahvero>
Date:   Wed, 27 Sep 2023 08:33:01 +0200
Cc:     Mimi Zohar <zohar@linux.ibm.com>,
        James Bottomley <jejb@linux.ibm.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Shawn Guo <shawnguo@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Ahmad Fatoum <a.fatoum@pengutronix.de>,
        sigma star Kernel Team <upstream+dcp@sigma-star.at>,
        David Howells <dhowells@redhat.com>,
        Li Yang <leoyang.li@nxp.com>, Paul Moore <paul@paul-moore.com>,
        James Morris <jmorris@namei.org>,
        "Serge E. Hallyn" <serge@hallyn.com>,
        "Paul E. McKenney" <paulmck@kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Tejun Heo <tj@kernel.org>,
        "Steven Rostedt (Google)" <rostedt@goodmis.org>,
        linux-doc@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-integrity@vger.kernel.org" <linux-integrity@vger.kernel.org>,
        "keyrings@vger.kernel.org" <keyrings@vger.kernel.org>,
        "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linuxppc-dev@lists.ozlabs.org,
        "linux-security-module@vger.kernel.org" 
        <linux-security-module@vger.kernel.org>,
        Richard Weinberger <richard@nod.at>,
        David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Content-Transfer-Encoding: quoted-printable
Message-Id: <085CABBD-1EA1-44A9-AA9C-C04039A627AB@sigma-star.at>
References: <20230918141826.8139-1-david@sigma-star.at>
 <20230918141826.8139-3-david@sigma-star.at>
 <CVS3WN3Q04XY.B40S4RBH9QM7@suppilovahvero>
To:     Jarkko Sakkinen <jarkko@kernel.org>
X-Mailer: Apple Mail (2.3731.700.6)
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Jarkko,

> On 25.09.2023, at 17:34, Jarkko Sakkinen <jarkko@kernel.org> wrote:
>=20
> On Mon Sep 18, 2023 at 5:18 PM EEST, David Gstir wrote:
>> DCP (Data Co-Processor) is the little brother of NXP's CAAM IP.
>>=20
>> Beside of accelerated crypto operations, it also offers support for
>> hardware-bound keys. Using this feature it is possible to implement a =
blob
>> mechanism just like CAAM offers. Unlike on CAAM, constructing and
>> parsing the blob has to happen in software.
>>=20
>> We chose the following format for the blob:
>=20
> Who is we?

The authors of this patch. But I=E2=80=99ll rephrase that to get rid
of the academic paper style.

> And there is no choosing anything if the below structure if hardware
> defined (not software defined):

The below structure is actually software-defined by this patch.
Contrary to CAAM, DCP does not have a key blob feature.
DCP=E2=80=99s hardware-bound UNIQUE or OTP key is used to bind
these key blobs to a specific DCP chip.


>=20
>> /*
>> * struct dcp_blob_fmt - DCP BLOB format.
>> *
>> * @fmt_version: Format version, currently being %1
>> * @blob_key: Random AES 128 key which is used to encrypt @payload,
>> *            @blob_key itself is encrypted with OTP or UNIQUE device =
key in
>> *            AES-128-ECB mode by DCP.
>> * @nonce: Random nonce used for @payload encryption.
>> * @payload_len: Length of the plain text @payload.
>> * @payload: The payload itself, encrypted using AES-128-GCM and =
@blob_key,
>> *           GCM auth tag of size AES_BLOCK_SIZE is attached at the =
end of it.
>> *
>> * The total size of a DCP BLOB is sizeof(struct dcp_blob_fmt) + =
@payload_len +
>> * AES_BLOCK_SIZE.
>> */
>> struct dcp_blob_fmt {
>> __u8 fmt_version;
>> __u8 blob_key[AES_KEYSIZE_128];
>> __u8 nonce[AES_KEYSIZE_128];
>> __le32 payload_len;
>> __u8 payload[];
>> } __packed;
>>=20
>> @payload is the key provided by trusted_key_ops->seal().
>>=20
>> By default the UNIQUE device key is used, it is also possible to use
>> the OTP key. While the UNIQUE device key should be unique it is not
>> entirely clear whether this is the case due to unclear documentation.
>> If someone wants to be sure they can burn their own unique key
>> into the OTP fuse and set the use_otp_key module parameter.
>>=20
>> Co-developed-by: Richard Weinberger <richard@nod.at>
>> Signed-off-by: Richard Weinberger <richard@nod.at>
>> Co-developed-by: David Oberhollenzer =
<david.oberhollenzer@sigma-star.at>
>> Signed-off-by: David Oberhollenzer =
<david.oberhollenzer@sigma-star.at>
>> Signed-off-by: David Gstir <david@sigma-star.at>
>> ---
>> .../admin-guide/kernel-parameters.txt         |  13 +
>=20
> Separate commit for this.
>=20
>> MAINTAINERS                                   |   9 +
>=20
> Ditto (i.e. total two additional patches).

Will do for v4!=20

Thanks,
- David=
