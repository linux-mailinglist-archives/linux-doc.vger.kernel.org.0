Return-Path: <linux-doc+bounces-47781-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EFF4AC81A4
	for <lists+linux-doc@lfdr.de>; Thu, 29 May 2025 19:25:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8BCEF1BA1DB7
	for <lists+linux-doc@lfdr.de>; Thu, 29 May 2025 17:25:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA75F22FDF2;
	Thu, 29 May 2025 17:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FJAn4UXm"
X-Original-To: linux-doc@vger.kernel.org
Received: from mail-il1-f182.google.com (mail-il1-f182.google.com [209.85.166.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ECB422DFE3
	for <linux-doc@vger.kernel.org>; Thu, 29 May 2025 17:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748539525; cv=none; b=NReyYWRqNZ0svMjH95svtoFQsg71K01ByIgEgU3iqGptz1NwKXCyYQPLlyvGtBb+l1uutbg9fSmPwukvjPS2cJU3fAOgOUOotQV/CBMTn+KA+ItT5kWDRZY+Jx0siCH3gQBlFbrbc/L5IggY0991d3F4ObIWz2ILWsOzRSBkHZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748539525; c=relaxed/simple;
	bh=R7W36fC9mqA2YImazGJzMilva/IX/vW7Fpjaef9QXRk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bk9BD8yVKAdAXKoN1Vg7rU84e1pR9EundrDpkAHpSuM2VG4wxw5cMOXKHWyZtswlyas0Vx2BUy+If/e+o0x39pojd/7wT4chYjYzSnpYabh8mROPX0nLjzqGpaaMkBKCHbo4IQpFSjSQlvE5eRbpg/9lrvHIAmR37g5qZ95QfIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FJAn4UXm; arc=none smtp.client-ip=209.85.166.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-il1-f182.google.com with SMTP id e9e14a558f8ab-3dd89a85414so13625ab.0
        for <linux-doc@vger.kernel.org>; Thu, 29 May 2025 10:25:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748539522; x=1749144322; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Aq5UWqCDWZg2jUBruTrKCignhLetlhTEoSWLRFlBvKY=;
        b=FJAn4UXmJ5F2YEZhhj6T/KCixe1TGMF1njpw7gZuPOMxpCb0jGfNY9QBXF3m1qLc8F
         QJLrDBYCch1Dbt3FuTopTR8HB/uJwmotD0Rq3QT1o2hdY/2xsyDieb1Nzrm5tofwbtQm
         CLqd4DDmVTRrxqJuAQVaAVTIftTidT6eTcil/VSeFhU5IFIFcq3eCJ92wsJfUpw/Py1Q
         7/fEFV3BPOExF6etTJ3O2K2Cm/0Zz6DA1PEqGNF0nPXiZ1A3Ry65zQgDSj/UbluErU4N
         kBvrAdeFNNTToXdBExMVUR+XSG4xMv09Dzrkifr8dLoicPXIDc9JKCzVVg5GrxO/iPT8
         vd7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748539522; x=1749144322;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Aq5UWqCDWZg2jUBruTrKCignhLetlhTEoSWLRFlBvKY=;
        b=TOprE9H3oRKnNxYCHlR0Ni6aPbG6rpRtC9+RlUXZVMFCZKYBxo+Fhz5DizM+RX8BLP
         SQKP81OhLQ3p9ArqAh/Ru7Z3EFSlkhGpJTfOY/Bp1WwSOaUuPPm+yGgSh+wNFZQfxVnI
         AiwDlHst3YoFeoG0hSfcQDXzhUpGDV6B9uXzddYTik9+V/c1dT/Nrme/AlSZFgi7rb/g
         stquIQlIzezajgEYB1nh3SBFzor+NPGZKpBsB/RLymh5ptFDJCHrK6ROSzPSgEFYhDfH
         HjvxPGpUjMvujQMRW0xWCxGyE1nVMQyaJ5UWVg3CDoq/wDFGqSoWmtYM7vfTgJ9plBeE
         p3Rw==
X-Forwarded-Encrypted: i=1; AJvYcCVblqWZ3dMeI0HFqqoaYxS9mOQj0rlNI+73Px5Nh0KPPyLj70d5s0XZet0XyBIMHS/sCIRB/Kx3c7k=@vger.kernel.org
X-Gm-Message-State: AOJu0YxFJtkWFgWfKzrK0loKL8orONo3D7DRzc8Ied+OUmJjFimVecYx
	ZnJv+AZFLCuvkvpZnZQRGBERUMjKXZ5YdkiZsZlJbbTBUVOHsOUcg5I1KP8rUHQKXwj+PEblD6P
	5WozaXr6nsbThiMuQWqzOhZEsuV1+qXv+przDrzoe
X-Gm-Gg: ASbGncs4luzrcFanszUfAW3p1OdtBUPU5EoBm+RLLRScxfxr+qn4pK50pTnSf5Vta7z
	h/z8KHE0dtJoE1BKOtYV97Cdog3t81MfX8WRMajXy+vFKwCVPcB8E5ziCM/kTlGgze8Rbf1dCUu
	1lyC82bMAykWDtrB6BKoMtBxPJQmx0On9C+Geic7ze/VgFXEXVF5vwjyrJZGj9AOY5KkHJByvGW
	Zxa/Ytuag0=
X-Google-Smtp-Source: AGHT+IEieB0z/jaUQ85p0bxGKF/BsfxceTJbHzW2dlAAgUo/3U0hH7+izTddIgjUp6yv6WeWDg6P6NOKrSVA54Daxp0=
X-Received: by 2002:a05:6e02:b4e:b0:3dc:8041:235b with SMTP id
 e9e14a558f8ab-3dd93102438mr3785775ab.5.1748539521790; Thu, 29 May 2025
 10:25:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250529-james-perf-feat_spe_eft-v2-0-a01a9baad06a@linaro.org> <20250529-james-perf-feat_spe_eft-v2-10-a01a9baad06a@linaro.org>
In-Reply-To: <20250529-james-perf-feat_spe_eft-v2-10-a01a9baad06a@linaro.org>
From: Ian Rogers <irogers@google.com>
Date: Thu, 29 May 2025 10:25:09 -0700
X-Gm-Features: AX0GCFsMi0PuJSkUZIq3glS5t7yiPh54_nxoMbLwC4oi0UtVw-ij7ss9J0KioO4
Message-ID: <CAP-5=fUOfEskPp_5myy167bpZ47NjavWU_8vAMpPo4TSWJRs-w@mail.gmail.com>
Subject: Re: [PATCH v2 10/11] perf tools: Add support for perf_event_attr::config4
To: James Clark <james.clark@linaro.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	linux-doc@vger.kernel.org, kvmarm@lists.linux.dev, Leo Yan <leo.yan@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 29, 2025 at 4:33=E2=80=AFAM James Clark <james.clark@linaro.org=
> wrote:
>
> perf_event_attr has gained a new field, config4, so add support for it
> extending the existing configN support.
>
> Reviewed-by: Leo Yan <leo.yan@arm.com>
> Signed-off-by: James Clark <james.clark@linaro.org>

Reviewed-by: Ian Rogers <irogers@google.com>

Thanks,
Ian

> ---
>  tools/perf/tests/parse-events.c | 14 +++++++++++++-
>  tools/perf/util/parse-events.c  | 11 +++++++++++
>  tools/perf/util/parse-events.h  |  1 +
>  tools/perf/util/parse-events.l  |  1 +
>  tools/perf/util/pmu.c           |  8 ++++++++
>  tools/perf/util/pmu.h           |  1 +
>  6 files changed, 35 insertions(+), 1 deletion(-)
>
> diff --git a/tools/perf/tests/parse-events.c b/tools/perf/tests/parse-eve=
nts.c
> index 5ec2e5607987..5f624a63d550 100644
> --- a/tools/perf/tests/parse-events.c
> +++ b/tools/perf/tests/parse-events.c
> @@ -615,6 +615,8 @@ static int test__checkevent_pmu(struct evlist *evlist=
)
>         TEST_ASSERT_VAL("wrong config1",    1 =3D=3D evsel->core.attr.con=
fig1);
>         TEST_ASSERT_VAL("wrong config2",    3 =3D=3D evsel->core.attr.con=
fig2);
>         TEST_ASSERT_VAL("wrong config3",    0 =3D=3D evsel->core.attr.con=
fig3);
> +       TEST_ASSERT_VAL("wrong config4",    0 =3D=3D evsel->core.attr.con=
fig4);
> +
>         /*
>          * The period value gets configured within evlist__config,
>          * while this test executes only parse events method.
> @@ -637,6 +639,7 @@ static int test__checkevent_list(struct evlist *evlis=
t)
>                 TEST_ASSERT_VAL("wrong config1", 0 =3D=3D evsel->core.att=
r.config1);
>                 TEST_ASSERT_VAL("wrong config2", 0 =3D=3D evsel->core.att=
r.config2);
>                 TEST_ASSERT_VAL("wrong config3", 0 =3D=3D evsel->core.att=
r.config3);
> +               TEST_ASSERT_VAL("wrong config4", 0 =3D=3D evsel->core.att=
r.config4);
>                 TEST_ASSERT_VAL("wrong exclude_user", !evsel->core.attr.e=
xclude_user);
>                 TEST_ASSERT_VAL("wrong exclude_kernel", !evsel->core.attr=
.exclude_kernel);
>                 TEST_ASSERT_VAL("wrong exclude_hv", !evsel->core.attr.exc=
lude_hv);
> @@ -813,6 +816,15 @@ static int test__checkterms_simple(struct parse_even=
ts_terms *terms)
>         TEST_ASSERT_VAL("wrong val", term->val.num =3D=3D 4);
>         TEST_ASSERT_VAL("wrong config", !strcmp(term->config, "config3"))=
;
>
> +       /* config4=3D5 */
> +       term =3D list_entry(term->list.next, struct parse_events_term, li=
st);
> +       TEST_ASSERT_VAL("wrong type term",
> +                       term->type_term =3D=3D PARSE_EVENTS__TERM_TYPE_CO=
NFIG4);
> +       TEST_ASSERT_VAL("wrong type val",
> +                       term->type_val =3D=3D PARSE_EVENTS__TERM_TYPE_NUM=
);
> +       TEST_ASSERT_VAL("wrong val", term->val.num =3D=3D 5);
> +       TEST_ASSERT_VAL("wrong config", !strcmp(term->config, "config4"))=
;
> +
>         /* umask=3D1*/
>         term =3D list_entry(term->list.next, struct parse_events_term, li=
st);
>         TEST_ASSERT_VAL("wrong type term",
> @@ -2451,7 +2463,7 @@ struct terms_test {
>
>  static const struct terms_test test__terms[] =3D {
>         [0] =3D {
> -               .str   =3D "config=3D10,config1,config2=3D3,config3=3D4,u=
mask=3D1,read,r0xead",
> +               .str   =3D "config=3D10,config1,config2=3D3,config3=3D4,c=
onfig4=3D5,umask=3D1,read,r0xead",
>                 .check =3D test__checkterms_simple,
>         },
>  };
> diff --git a/tools/perf/util/parse-events.c b/tools/perf/util/parse-event=
s.c
> index 5152fd5a6ead..7e37f91e7b49 100644
> --- a/tools/perf/util/parse-events.c
> +++ b/tools/perf/util/parse-events.c
> @@ -247,6 +247,8 @@ __add_event(struct list_head *list, int *idx,
>                                               PERF_PMU_FORMAT_VALUE_CONFI=
G2, "config2");
>                 perf_pmu__warn_invalid_config(pmu, attr->config3, name,
>                                               PERF_PMU_FORMAT_VALUE_CONFI=
G3, "config3");
> +               perf_pmu__warn_invalid_config(pmu, attr->config4, name,
> +                                             PERF_PMU_FORMAT_VALUE_CONFI=
G4, "config4");
>         }
>         if (init_attr)
>                 event_attr_init(attr);
> @@ -783,6 +785,7 @@ const char *parse_events__term_type_str(enum parse_ev=
ents__term_type term_type)
>                 [PARSE_EVENTS__TERM_TYPE_CONFIG1]               =3D "conf=
ig1",
>                 [PARSE_EVENTS__TERM_TYPE_CONFIG2]               =3D "conf=
ig2",
>                 [PARSE_EVENTS__TERM_TYPE_CONFIG3]               =3D "conf=
ig3",
> +               [PARSE_EVENTS__TERM_TYPE_CONFIG4]               =3D "conf=
ig4",
>                 [PARSE_EVENTS__TERM_TYPE_NAME]                  =3D "name=
",
>                 [PARSE_EVENTS__TERM_TYPE_SAMPLE_PERIOD]         =3D "peri=
od",
>                 [PARSE_EVENTS__TERM_TYPE_SAMPLE_FREQ]           =3D "freq=
",
> @@ -830,6 +833,7 @@ config_term_avail(enum parse_events__term_type term_t=
ype, struct parse_events_er
>         case PARSE_EVENTS__TERM_TYPE_CONFIG1:
>         case PARSE_EVENTS__TERM_TYPE_CONFIG2:
>         case PARSE_EVENTS__TERM_TYPE_CONFIG3:
> +       case PARSE_EVENTS__TERM_TYPE_CONFIG4:
>         case PARSE_EVENTS__TERM_TYPE_NAME:
>         case PARSE_EVENTS__TERM_TYPE_METRIC_ID:
>         case PARSE_EVENTS__TERM_TYPE_SAMPLE_PERIOD:
> @@ -898,6 +902,10 @@ do {                                                =
                          \
>                 CHECK_TYPE_VAL(NUM);
>                 attr->config3 =3D term->val.num;
>                 break;
> +       case PARSE_EVENTS__TERM_TYPE_CONFIG4:
> +               CHECK_TYPE_VAL(NUM);
> +               attr->config4 =3D term->val.num;
> +               break;
>         case PARSE_EVENTS__TERM_TYPE_SAMPLE_PERIOD:
>                 CHECK_TYPE_VAL(NUM);
>                 break;
> @@ -1097,6 +1105,7 @@ static int config_term_tracepoint(struct perf_event=
_attr *attr,
>         case PARSE_EVENTS__TERM_TYPE_CONFIG1:
>         case PARSE_EVENTS__TERM_TYPE_CONFIG2:
>         case PARSE_EVENTS__TERM_TYPE_CONFIG3:
> +       case PARSE_EVENTS__TERM_TYPE_CONFIG4:
>         case PARSE_EVENTS__TERM_TYPE_NAME:
>         case PARSE_EVENTS__TERM_TYPE_SAMPLE_PERIOD:
>         case PARSE_EVENTS__TERM_TYPE_SAMPLE_FREQ:
> @@ -1237,6 +1246,7 @@ do {                                               =
               \
>                 case PARSE_EVENTS__TERM_TYPE_CONFIG1:
>                 case PARSE_EVENTS__TERM_TYPE_CONFIG2:
>                 case PARSE_EVENTS__TERM_TYPE_CONFIG3:
> +               case PARSE_EVENTS__TERM_TYPE_CONFIG4:
>                 case PARSE_EVENTS__TERM_TYPE_NAME:
>                 case PARSE_EVENTS__TERM_TYPE_METRIC_ID:
>                 case PARSE_EVENTS__TERM_TYPE_RAW:
> @@ -1274,6 +1284,7 @@ static int get_config_chgs(struct perf_pmu *pmu, st=
ruct parse_events_terms *head
>                 case PARSE_EVENTS__TERM_TYPE_CONFIG1:
>                 case PARSE_EVENTS__TERM_TYPE_CONFIG2:
>                 case PARSE_EVENTS__TERM_TYPE_CONFIG3:
> +               case PARSE_EVENTS__TERM_TYPE_CONFIG4:
>                 case PARSE_EVENTS__TERM_TYPE_NAME:
>                 case PARSE_EVENTS__TERM_TYPE_SAMPLE_PERIOD:
>                 case PARSE_EVENTS__TERM_TYPE_SAMPLE_FREQ:
> diff --git a/tools/perf/util/parse-events.h b/tools/perf/util/parse-event=
s.h
> index e176a34ab088..6e90c26066d4 100644
> --- a/tools/perf/util/parse-events.h
> +++ b/tools/perf/util/parse-events.h
> @@ -58,6 +58,7 @@ enum parse_events__term_type {
>         PARSE_EVENTS__TERM_TYPE_CONFIG1,
>         PARSE_EVENTS__TERM_TYPE_CONFIG2,
>         PARSE_EVENTS__TERM_TYPE_CONFIG3,
> +       PARSE_EVENTS__TERM_TYPE_CONFIG4,
>         PARSE_EVENTS__TERM_TYPE_NAME,
>         PARSE_EVENTS__TERM_TYPE_SAMPLE_PERIOD,
>         PARSE_EVENTS__TERM_TYPE_SAMPLE_FREQ,
> diff --git a/tools/perf/util/parse-events.l b/tools/perf/util/parse-event=
s.l
> index 7ed86e3e34e3..8e2986d55bc4 100644
> --- a/tools/perf/util/parse-events.l
> +++ b/tools/perf/util/parse-events.l
> @@ -317,6 +317,7 @@ config                      { return term(yyscanner, =
PARSE_EVENTS__TERM_TYPE_CONFIG); }
>  config1                        { return term(yyscanner, PARSE_EVENTS__TE=
RM_TYPE_CONFIG1); }
>  config2                        { return term(yyscanner, PARSE_EVENTS__TE=
RM_TYPE_CONFIG2); }
>  config3                        { return term(yyscanner, PARSE_EVENTS__TE=
RM_TYPE_CONFIG3); }
> +config4                        { return term(yyscanner, PARSE_EVENTS__TE=
RM_TYPE_CONFIG4); }
>  name                   { return term(yyscanner, PARSE_EVENTS__TERM_TYPE_=
NAME); }
>  period                 { return term(yyscanner, PARSE_EVENTS__TERM_TYPE_=
SAMPLE_PERIOD); }
>  freq                   { return term(yyscanner, PARSE_EVENTS__TERM_TYPE_=
SAMPLE_FREQ); }
> diff --git a/tools/perf/util/pmu.c b/tools/perf/util/pmu.c
> index b7ebac5ab1d1..fc50df65d540 100644
> --- a/tools/perf/util/pmu.c
> +++ b/tools/perf/util/pmu.c
> @@ -1427,6 +1427,10 @@ static int pmu_config_term(const struct perf_pmu *=
pmu,
>                         assert(term->type_val =3D=3D PARSE_EVENTS__TERM_T=
YPE_NUM);
>                         pmu_format_value(bits, term->val.num, &attr->conf=
ig3, zero);
>                         break;
> +               case PARSE_EVENTS__TERM_TYPE_CONFIG4:
> +                       assert(term->type_val =3D=3D PARSE_EVENTS__TERM_T=
YPE_NUM);
> +                       pmu_format_value(bits, term->val.num, &attr->conf=
ig4, zero);
> +                       break;
>                 case PARSE_EVENTS__TERM_TYPE_USER: /* Not hardcoded. */
>                         return -EINVAL;
>                 case PARSE_EVENTS__TERM_TYPE_NAME ... PARSE_EVENTS__TERM_=
TYPE_HARDWARE:
> @@ -1474,6 +1478,9 @@ static int pmu_config_term(const struct perf_pmu *p=
mu,
>         case PERF_PMU_FORMAT_VALUE_CONFIG3:
>                 vp =3D &attr->config3;
>                 break;
> +       case PERF_PMU_FORMAT_VALUE_CONFIG4:
> +               vp =3D &attr->config4;
> +               break;
>         default:
>                 return -EINVAL;
>         }
> @@ -1787,6 +1794,7 @@ int perf_pmu__for_each_format(struct perf_pmu *pmu,=
 void *state, pmu_format_call
>                 "config1=3D0..0xffffffffffffffff",
>                 "config2=3D0..0xffffffffffffffff",
>                 "config3=3D0..0xffffffffffffffff",
> +               "config4=3D0..0xffffffffffffffff",
>                 "name=3Dstring",
>                 "period=3Dnumber",
>                 "freq=3Dnumber",
> diff --git a/tools/perf/util/pmu.h b/tools/perf/util/pmu.h
> index b93014cc3670..1ce5377935db 100644
> --- a/tools/perf/util/pmu.h
> +++ b/tools/perf/util/pmu.h
> @@ -22,6 +22,7 @@ enum {
>         PERF_PMU_FORMAT_VALUE_CONFIG1,
>         PERF_PMU_FORMAT_VALUE_CONFIG2,
>         PERF_PMU_FORMAT_VALUE_CONFIG3,
> +       PERF_PMU_FORMAT_VALUE_CONFIG4,
>         PERF_PMU_FORMAT_VALUE_CONFIG_END,
>  };
>
>
> --
> 2.34.1
>

