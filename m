Return-Path: <linux-doc+bounces-35022-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 449DEA0B60A
	for <lists+linux-doc@lfdr.de>; Mon, 13 Jan 2025 12:49:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 457BF16289B
	for <lists+linux-doc@lfdr.de>; Mon, 13 Jan 2025 11:49:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 588A81CAA8B;
	Mon, 13 Jan 2025 11:49:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="h+7djyeD"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 814A01C1F10
	for <linux-doc@vger.kernel.org>; Mon, 13 Jan 2025 11:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736768993; cv=none; b=bxazGe560+xCQcOQtmWcH7GzU5n1T5AJJs0SutmEdBg65yWY088bK6T46x5iR62LkEJzVxvbCTBXL3X6kObqJOQai4VQDiQRgqVUTMZx+0lVCJ86ivNKoEkmaeD/1Hb1ynon3lgpu4GBYSh2IhXyJhO03r5EGJNn3Ch8qMdWqzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736768993; c=relaxed/simple;
	bh=kASy4+oddbLz9Yx5v1O86uc0qRrX0/D0QMt9Yg+w8hs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z8Zva2Hnh9nt5w6gva4pa/g2E+f+JdE9zpXkWtbGYA4uFiSZPKi3m+fB+DVroWxFDlwV/vXQ1PXsjlu4NQTpEoIrqT4sePXmTM4M6vyVrlnOWWYkRLFvfPatERDwE/pN0m7VMXsqYT6ozKVAe5HMHK8gEDrAidOQROlCX12RE+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=h+7djyeD; arc=none smtp.client-ip=209.85.160.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-29fe83208a4so2070710fac.0
        for <linux-doc@vger.kernel.org>; Mon, 13 Jan 2025 03:49:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1736768990; x=1737373790; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1nxXIufJfQT/+2LRcjv+0GN2VkekSXywM2L5DVApxZo=;
        b=h+7djyeDwjNsdiQKmQQQY3LVaBfZERzBePybgrHo/9+aMwcQKReNzmlewFWToZceB5
         dCfVHeU7HrgcOz4rkNj3lMRSmx+G3QBPBXdKLYjzgtwaC3cnyR1GySyFxufqYd3x7zx+
         1iiK6b4MppFe5wbOVGQ2tAE64o1N0ovrYIXnxc2kVaciS/n4ExkSnbgUOVOceqMGLaPb
         KvmWFOC2o7wYWXf836yDRC/0+XPXW34E3dApVJwsHTG6v2itLKq+KgwY4VmosFTnw1E0
         Si2Bi6itB2uXiyWhiB99+85asdBRnG9vxwDHf/ikMXpAQK/havdviB0Ysw3+JSFp7kFN
         JhPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736768990; x=1737373790;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1nxXIufJfQT/+2LRcjv+0GN2VkekSXywM2L5DVApxZo=;
        b=TfJUZ1V0nbkMnwU8rcmbIdZUIIu4JZIC9Ut1KI3xI43jpNo3v9NPIgVb/Ev8h5+r+J
         cVbOgnrW8GXksy0675v2b8AJiWcuFNaUALrMWJHt9wZOZ+96LX5SsSw4Zasx3a1w2bg+
         EnX6mwGPspHVMT3c1TnrfZB5hki0/xnlTNQDCP0pCH+fnHPfuhot+FuiBNrYloC0eMup
         cw8peGkNobRWFtmR/aeX7sa1+3ESNjGIydGti4vhsc3NJzNDYZ9Ow67ihwutqKqBe/5/
         ddtPEnkghyXxs5zb4hLzDGEOr7I6dlkOPL3S70sDSkRLVyG4Ld0RjbmtG5V4kb3FWcsN
         zzgg==
X-Forwarded-Encrypted: i=1; AJvYcCVAfZKkBJXGDCMBLVis0mRIAoKJV27s43eQNUo13hKJNEYXiAWbLDODRZxTxK2/FfSkc99jAOBZ3GQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyob9DSKMXSR+x1D/nmRbB8AqEsMQVtqrseGKrSnKSx2U8xMhK9
	heW2ftfnFykY4AOxI08yQgaDhDec31ORhqpqDVlesPPC11L5cHvQWDYomgDO7LEkcpfqxixgsaX
	rf1sqIfzE9yG11HG6ZhZTYpjYcHZn8Nm5060dYA==
X-Gm-Gg: ASbGncuvNhCNXt+9vg8p/F865feEGSA73hJUxnkHiDBtru4lyDT/TDy83jM6yEsfs3u
	kd/jvwgIlGgjAbNF2WYt2YKBatdnvAtNjxEpOC/C0
X-Google-Smtp-Source: AGHT+IHmlmecRpISNnwwnnczbKA8ckxNfHWQKxqB4E2q31ud7Q7wae29cIOROv0c/K2MlktScWO0mWGN0FqFgN/EAhM=
X-Received: by 2002:a05:6870:9c8d:b0:29e:7629:1466 with SMTP id
 586e51a60fabf-2aacdbc936amr9625679fac.7.1736768990431; Mon, 13 Jan 2025
 03:49:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250113083635.73826-1-cuiyunhui@bytedance.com>
 <20250113083635.73826-3-cuiyunhui@bytedance.com> <20250113-cb08bcb35bc8b6213fe89ecd@orel>
In-Reply-To: <20250113-cb08bcb35bc8b6213fe89ecd@orel>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Mon, 13 Jan 2025 19:49:39 +0800
X-Gm-Features: AbW1kvbReMKJie7bhFXKtPxqu5CFzhTpUn7lkusFoZnCr9Uq-zowmKp2XnelTqU
Message-ID: <CAEEQ3wmOVKiy1FVdB+LggdX-7a_JMh+2A-bjG0XGF7nY0Goo2w@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v3 3/3] RISC-V: selftests: Add TEST_ZICBOM
 into CBO tests
To: Andrew Jones <ajones@ventanamicro.com>
Cc: alexghiti@rivosinc.com, andybnac@gmail.com, aou@eecs.berkeley.edu, 
	charlie@rivosinc.com, cleger@rivosinc.com, conor.dooley@microchip.com, 
	conor@kernel.org, corbet@lwn.net, evan@rivosinc.com, jesse@rivosinc.com, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org, 
	palmer@dabbelt.com, paul.walmsley@sifive.com, samuel.holland@sifive.com, 
	shuah@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi drew,

On Mon, Jan 13, 2025 at 5:18=E2=80=AFPM Andrew Jones <ajones@ventanamicro.c=
om> wrote:
>
> On Mon, Jan 13, 2025 at 04:36:35PM +0800, Yunhui Cui wrote:
> > Add test for Zicbom and its block size into CBO tests, when
> > Zicbom is present, test that cbo.clean/flush may be issued and works.
> > As the software can't verify the clean/flush functions, we just judged
> > that cbo.clean/flush isn't executed illegally.
> >
> > Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
> > ---
> >  tools/testing/selftests/riscv/hwprobe/cbo.c | 49 ++++++++++++++++++---
> >  1 file changed, 43 insertions(+), 6 deletions(-)
> >
> > diff --git a/tools/testing/selftests/riscv/hwprobe/cbo.c b/tools/testin=
g/selftests/riscv/hwprobe/cbo.c
> > index a40541bb7c7d..b63e23f95e08 100644
> > --- a/tools/testing/selftests/riscv/hwprobe/cbo.c
> > +++ b/tools/testing/selftests/riscv/hwprobe/cbo.c
> > @@ -81,6 +81,30 @@ static bool is_power_of_2(__u64 n)
> >       return n !=3D 0 && (n & (n - 1)) =3D=3D 0;
> >  }
> >
> > +static void test_zicbom(void *arg)
> > +{
> > +     struct riscv_hwprobe pair =3D {
> > +             .key =3D RISCV_HWPROBE_KEY_ZICBOM_BLOCK_SIZE,
> > +     };
> > +     cpu_set_t *cpus =3D (cpu_set_t *)arg;
> > +     __u64 block_size;
> > +     long rc;
> > +
> > +     rc =3D riscv_hwprobe(&pair, 1, sizeof(cpu_set_t), (unsigned long =
*)cpus, 0);
> > +     block_size =3D pair.value;
> > +     ksft_test_result(rc =3D=3D 0 && pair.key =3D=3D RISCV_HWPROBE_KEY=
_ZICBOM_BLOCK_SIZE &&
> > +                      is_power_of_2(block_size), "Zicbom block size\n"=
);
> > +     ksft_print_msg("Zicbom block size: %llu\n", block_size);
> > +
> > +     illegal_insn =3D false;
> > +     cbo_clean(&mem[block_size]);
> > +     ksft_test_result(!illegal_insn, "cbo.clean\n");
> > +
> > +     illegal_insn =3D false;
> > +     cbo_flush(&mem[block_size]);
> > +     ksft_test_result(!illegal_insn, "cbo.flush\n");
> > +}
> > +
> >  static void test_zicboz(void *arg)
> >  {
> >       struct riscv_hwprobe pair =3D {
> > @@ -129,7 +153,7 @@ static void test_zicboz(void *arg)
> >       ksft_test_result_pass("cbo.zero check\n");
> >  }
> >
> > -static void check_no_zicboz_cpus(cpu_set_t *cpus)
> > +static void check_no_zicbo_cpus(cpu_set_t *cpus, __u64 cbo)
> >  {
> >       struct riscv_hwprobe pair =3D {
> >               .key =3D RISCV_HWPROBE_KEY_IMA_EXT_0,
> > @@ -137,6 +161,7 @@ static void check_no_zicboz_cpus(cpu_set_t *cpus)
> >       cpu_set_t one_cpu;
> >       int i =3D 0, c =3D 0;
> >       long rc;
> > +     char *cbostr;
> >
> >       while (i++ < CPU_COUNT(cpus)) {
> >               while (!CPU_ISSET(c, cpus))
> > @@ -148,10 +173,13 @@ static void check_no_zicboz_cpus(cpu_set_t *cpus)
> >               rc =3D riscv_hwprobe(&pair, 1, sizeof(cpu_set_t), (unsign=
ed long *)&one_cpu, 0);
> >               assert(rc =3D=3D 0 && pair.key =3D=3D RISCV_HWPROBE_KEY_I=
MA_EXT_0);
> >
> > -             if (pair.value & RISCV_HWPROBE_EXT_ZICBOZ)
> > -                     ksft_exit_fail_msg("Zicboz is only present on a s=
ubset of harts.\n"
> > -                                        "Use taskset to select a set o=
f harts where Zicboz\n"
> > -                                        "presence (present or not) is =
consistent for each hart\n");
> > +             cbostr =3D cbo =3D=3D RISCV_HWPROBE_EXT_ZICBOZ ? "Zicboz"=
 : "Zicbom";
> > +
> > +             if (pair.value & cbo)
> > +                     ksft_exit_fail_msg("%s is only present on a subse=
t of harts.\n"
> > +                                        "Use taskset to select a set o=
f harts where %s\n"
> > +                                        "presence (present or not) is =
consistent for each hart\n",
> > +                                        cbostr, cbostr);
> >               ++c;
> >       }
> >  }
> > @@ -159,6 +187,7 @@ static void check_no_zicboz_cpus(cpu_set_t *cpus)
> >  enum {
> >       TEST_ZICBOZ,
> >       TEST_NO_ZICBOZ,
> > +     TEST_ZICBOM,
> >       TEST_NO_ZICBOM,
> >  };
> >
> > @@ -169,6 +198,7 @@ static struct test_info {
> >  } tests[] =3D {
> >       [TEST_ZICBOZ]           =3D { .nr_tests =3D 3, test_zicboz },
> >       [TEST_NO_ZICBOZ]        =3D { .nr_tests =3D 1, test_no_zicboz },
> > +     [TEST_ZICBOM]           =3D { .nr_tests =3D 3, test_zicbom },
> >       [TEST_NO_ZICBOM]        =3D { .nr_tests =3D 3, test_no_zicbom },
> >  };
> >
> > @@ -206,7 +236,14 @@ int main(int argc, char **argv)
> >               tests[TEST_ZICBOZ].enabled =3D true;
> >               tests[TEST_NO_ZICBOZ].enabled =3D false;
> >       } else {
> > -             check_no_zicboz_cpus(&cpus);
> > +             check_no_zicbo_cpus(&cpus, RISCV_HWPROBE_EXT_ZICBOZ);
> > +     }
> > +
> > +     if (pair.value & RISCV_HWPROBE_EXT_ZICBOM) {
> > +             tests[TEST_ZICBOM].enabled =3D true;
> > +             tests[TEST_NO_ZICBOM].enabled =3D false;
> > +     } else {
> > +             check_no_zicbo_cpus(&cpus, RISCV_HWPROBE_EXT_ZICBOM);
> >       }
> >
> >       for (i =3D 0; i < ARRAY_SIZE(tests); ++i)
> > --
> > 2.39.2
> >
>
> The test_no_zicbom() test needs to have the illegal instruction SIGILL
> test for cbo.inval moved out into its own test. So, even when we have
> zicbom we still test that cbo.inval generates a SIGILL.

Do you mean moving cbo_inval() into test_zicbom()? Then does
cbo_inval(&mem[0]) also need to be tested in test_no_zicbom()?



> Thanks,
> drew

Thanks,
Yunhui

