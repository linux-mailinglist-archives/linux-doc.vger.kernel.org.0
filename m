Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 274944FA102
	for <lists+linux-doc@lfdr.de>; Sat,  9 Apr 2022 03:22:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230331AbiDIBYl (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Fri, 8 Apr 2022 21:24:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237706AbiDIBYj (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 8 Apr 2022 21:24:39 -0400
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B60B02C650
        for <linux-doc@vger.kernel.org>; Fri,  8 Apr 2022 18:22:33 -0700 (PDT)
Received: by mail-pj1-x102d.google.com with SMTP id ku13-20020a17090b218d00b001ca8fcd3adeso13383068pjb.2
        for <linux-doc@vger.kernel.org>; Fri, 08 Apr 2022 18:22:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=I0F2P2ML/pBi824KYgTw5KU1Y45bJmTHodkEFj/msPE=;
        b=rnIIkb90V9I9bcpVMa5/w0cTf4Gar8GVFDke+JSlU2hEHFp3OsRcTAqk7dfPeFG8tF
         dDExEmFCxiNoVK2EMa1ylHUlmv7DSThq6XmiX4TNJLDsXoKoUElD/mYy3ENP5lUCX6Cm
         L0cqaNurq1CWtLL/S3jZRhd8I253TJx1CfvGJLV8g4b2GyGGXfVeqwYyZcNtCYqWoaTJ
         rljgm3m6gGpplEG1geT3BvdWqZgCrGRUG3e99TyERwVqbDQLP1p54prwkHbmcNQHKk4J
         2yNkYps6CqNhbHgl2xIZXaESlcelXNqaHtoVajN8GB4WEs0RS7UrQYqzpjddvSoSRqdi
         sZ6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=I0F2P2ML/pBi824KYgTw5KU1Y45bJmTHodkEFj/msPE=;
        b=qlXSy2q4JuPJPMerOR/JPZn1F3Fa6yIjRXuXjnEXxXMfvt5ycvF/hkvh8sSNp15vI7
         WdAuRE2JUgpOLy0qkraNlFPEgYaRfXOhF+4w1bkz18KIwRZi7mFnOFC4PbbLwRZXRGi1
         STZFUcg2eYPxtMiry7jdcKku9R3/1+pkWWjespEIQnX6yRb6WZ/Yx3BogRd+Q5sPEemB
         CEu+iRXW5rlm+VCT0mk5CU8lf8Lw8oFkk8ClD6uXjL+09WCcN6xCsekwwZXmgJ0tP2cw
         EK6tOfWvRgAxSxF1gfXMJKzAV30v77VHIG86fXGYAhbRUKu5GwpNdM+K2Hn+y+2sLYWD
         EE6A==
X-Gm-Message-State: AOAM530ENwqJ5IVSEjAwt2cmDByscWp6TxoPdRZ0/5hmQvQrJVH3XbfQ
        96HxN496pDKVgPDEDcAWdMziEp2Pifx5snRbBkIRFQ==
X-Google-Smtp-Source: ABdhPJyJCUjj5J7R135dzSPAdcxIjuPzJmPklzIABqKF59nyK/U0cF2KfJdhnRS2Ev/Kou5gxn1s4+XTYi7R+kW7BNM=
X-Received: by 2002:a17:90b:3886:b0:1c7:c935:4447 with SMTP id
 mu6-20020a17090b388600b001c7c9354447mr25107776pjb.196.1649467351747; Fri, 08
 Apr 2022 18:22:31 -0700 (PDT)
MIME-Version: 1.0
References: <20220408045743.1432968-1-yosryahmed@google.com> <20220408045743.1432968-3-yosryahmed@google.com>
In-Reply-To: <20220408045743.1432968-3-yosryahmed@google.com>
From:   Yosry Ahmed <yosryahmed@google.com>
Date:   Fri, 8 Apr 2022 18:21:55 -0700
Message-ID: <CAJD7tkb6VJt=pfqnW11r6S7A0r2Vh85a3YZaVso-qyiCM06nDQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] selftests: cgroup: return the errno of write() in
 cg_write() on failure
To:     Johannes Weiner <hannes@cmpxchg.org>,
        Michal Hocko <mhocko@kernel.org>,
        Shakeel Butt <shakeelb@google.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Roman Gushchin <roman.gushchin@linux.dev>
Cc:     David Rientjes <rientjes@google.com>, Tejun Heo <tj@kernel.org>,
        Zefan Li <lizefan.x@bytedance.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <shuah@kernel.org>, Yu Zhao <yuzhao@google.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Wei Xu <weixugc@google.com>, Greg Thelen <gthelen@google.com>,
        Chen Wandun <chenwandun@huawei.com>,
        Vaibhav Jain <vaibhav@linux.ibm.com>,
        =?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>,
        Tim Chen <tim.c.chen@linux.intel.com>, cgroups@vger.kernel.org,
        linux-doc@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux-MM <linux-mm@kvack.org>, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Apr 7, 2022 at 9:57 PM Yosry Ahmed <yosryahmed@google.com> wrote:
>
> Currently, cg_write() returns 0 on success and -1 on failure. Modify it
> to return the errno of write() syscall when write() fails.
>
> Signed-off-by: Yosry Ahmed <yosryahmed@google.com>
> ---
>  tools/testing/selftests/cgroup/cgroup_util.c | 32 +++++++++++---------
>  1 file changed, 17 insertions(+), 15 deletions(-)
>
> diff --git a/tools/testing/selftests/cgroup/cgroup_util.c b/tools/testing/selftests/cgroup/cgroup_util.c
> index dbaa7aabbb4a..3b6bb09985fa 100644
> --- a/tools/testing/selftests/cgroup/cgroup_util.c
> +++ b/tools/testing/selftests/cgroup/cgroup_util.c
> @@ -38,23 +38,23 @@ static ssize_t read_text(const char *path, char *buf, size_t max_len)
>         return len;
>  }
>
> -static ssize_t write_text(const char *path, char *buf, ssize_t len)
> +/*
> + * Returns:
> + *     success -> 0
> + *     open() failure -> -1
> + *     write() failure -> errno
> + */
> +static int write_text(const char *path, char *buf, ssize_t len)
>  {
> -       int fd;
> +       int fd, ret;
>
>         fd = open(path, O_WRONLY | O_APPEND);
>         if (fd < 0)
>                 return fd;
>
> -       len = write(fd, buf, len);
> -       if (len < 0) {
> -               close(fd);
> -               return len;
> -       }
> -
> +       ret = write(fd, buf, len) < 0 ? errno : 0;
>         close(fd);
> -
> -       return len;
> +       return ret;
>  }
>
>  char *cg_name(const char *root, const char *name)
> @@ -177,17 +177,19 @@ long cg_read_lc(const char *cgroup, const char *control)
>         return cnt;
>  }
>
> +/*
> + * Returns:
> + *     success -> 0
> + *     open() failure -> -1
> + *     write() failure -> errno
> + */
>  int cg_write(const char *cgroup, const char *control, char *buf)
>  {
>         char path[PATH_MAX];
>         ssize_t len = strlen(buf);
>
>         snprintf(path, sizeof(path), "%s/%s", cgroup, control);
> -
> -       if (write_text(path, buf, len) == len)
> -               return 0;
> -
> -       return -1;
> +       return write_text(path, buf, len);
>  }

I have changed this in v4 to a cleaner implementation that either
returns 0 on success or -errno on failure. I also made sure to check
that the full buffer was being written, and updated cg_read() as well
for the interface to be consistent.

Will send out once the discussion on patch 1 in v3 reaches a consensus.

>
>  int cg_find_unified_root(char *root, size_t len)
> --
> 2.35.1.1178.g4f1659d476-goog
>
