Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9529240D677
	for <lists+linux-doc@lfdr.de>; Thu, 16 Sep 2021 11:43:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235798AbhIPJpJ (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Thu, 16 Sep 2021 05:45:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235524AbhIPJpI (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 16 Sep 2021 05:45:08 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2839BC061764
        for <linux-doc@vger.kernel.org>; Thu, 16 Sep 2021 02:43:48 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id t8so1452260wri.1
        for <linux-doc@vger.kernel.org>; Thu, 16 Sep 2021 02:43:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isovalent-com.20210112.gappssmtp.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=vMyxzYnGLIXigftdBAqV9yMGr7SyFbi9TFF15l4WZ8o=;
        b=bGEKNYVntYkua+rlEKSZTUjCc9reSlmQjIYaXOwPpunsNqyatW0HePiZQgk83Qm5eC
         7bhZMvpL9IWRHFrSHiYaJ3wcT5tUjvLzfNOU8nHOcwW+XdNCMGNiwSk/iEZ0Pyt87h5v
         HumjrYrr+NeX1HYiP7SQysd/c3Zk85fsxEh9j14c2U0rFy4sLMRmaImCI717udy0++VV
         EFT1uwTcuueI6vJFp2JYkcqVshbWkZe2/l889e/a2FPgE6l10mCfhKzSqg0OQOntrRbW
         e9tYErYSA831aPfexhrVU+9jEf/m+C6eD85mEKFq8zepcPJwROvWM1KwvC4pfiUy+FnR
         rO3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=vMyxzYnGLIXigftdBAqV9yMGr7SyFbi9TFF15l4WZ8o=;
        b=a6PR41OP0mYVmoFtRVcMt1mVs/FZlhoRIFti6cULQ0QKTD1ezZq9f9mSTO73qw6znn
         r4wRK3CHrcJnRg5x+R8/jalVzhlj5A+x99jRg/7A1Jxcal+XUX0ZgHoO2AB4Bks3FKb9
         h1jPiyHSDzJ89aMIwWGKZjjOrC4KaX49UOB8E/axEhKwlLWyo2lbKTLGEdF2MRUEYlcK
         ryTWKEbvDQ1qfbH7GnNnDsko/bjfXoCc/rGNv2IzzhnPTW8ItT8DiQppHmMjq9iZ6NFY
         7Cvtm9ZJxejOSio+Maxd3ZjFDxLA6EwAOHiTYYQojHIF48a+2OmxYtFgGpDNa2tV92aH
         DYiQ==
X-Gm-Message-State: AOAM531Q98Avz0cC5ucwQSrjo4AxU8FWCnzi0rOfFnMZOVodp24+elTk
        bhlY7nA2Lq24n1yMmlE5DY06wg==
X-Google-Smtp-Source: ABdhPJyyG1PVDSRfmks+2rkllu2IivPebbvtIJiooKKqGJWD7xMwdgVKf6MqnqIWLX7kfhF6PQm+6Q==
X-Received: by 2002:a5d:6da9:: with SMTP id u9mr4937429wrs.58.1631785426735;
        Thu, 16 Sep 2021 02:43:46 -0700 (PDT)
Received: from [192.168.1.8] ([149.86.87.95])
        by smtp.gmail.com with ESMTPSA id l19sm2573480wrc.16.2021.09.16.02.43.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Sep 2021 02:43:46 -0700 (PDT)
Subject: Re: [PATCH 08/24] tools: bpftool: update bpftool-prog.rst reference
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     "David S. Miller" <davem@davemloft.net>,
        Alexei Starovoitov <ast@kernel.org>,
        Andrii Nakryiko <andrii@kernel.org>,
        Daniel Borkmann <daniel@iogearbox.net>,
        David Beckett <david.beckett@netronome.com>,
        Jakub Kicinski <kuba@kernel.org>,
        John Fastabend <john.fastabend@gmail.com>,
        KP Singh <kpsingh@kernel.org>, Martin KaFai Lau <kafai@fb.com>,
        Shuah Khan <shuah@kernel.org>,
        Song Liu <songliubraving@fb.com>, Yonghong Song <yhs@fb.com>,
        bpf@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-kselftest@vger.kernel.org, netdev@vger.kernel.org
References: <cover.1631783482.git.mchehab+huawei@kernel.org>
 <dc4bae7a14518fbfff20a0f539df06a5c19b09de.1631783482.git.mchehab+huawei@kernel.org>
From:   Quentin Monnet <quentin@isovalent.com>
Message-ID: <eb80e8f5-b9d7-5031-8ebb-4595bb295dbf@isovalent.com>
Date:   Thu, 16 Sep 2021 10:43:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <dc4bae7a14518fbfff20a0f539df06a5c19b09de.1631783482.git.mchehab+huawei@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

2021-09-16 11:14 UTC+0200 ~ Mauro Carvalho Chehab
<mchehab+huawei@kernel.org>
> The file name: Documentation/bpftool-prog.rst
> should be, instead: tools/bpf/bpftool/Documentation/bpftool-prog.rst.
> 
> Update its cross-reference accordingly.
> 
> Fixes: a2b5944fb4e0 ("selftests/bpf: Check consistency between bpftool source, doc, completion")
> Fixes: ff69c21a85a4 ("tools: bpftool: add documentation")

Hi,
How is this a fix for the commit that added the documentation in bpftool?

> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  tools/testing/selftests/bpf/test_bpftool_synctypes.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/bpf/test_bpftool_synctypes.py b/tools/testing/selftests/bpf/test_bpftool_synctypes.py
> index be54b7335a76..27a2c369a798 100755
> --- a/tools/testing/selftests/bpf/test_bpftool_synctypes.py
> +++ b/tools/testing/selftests/bpf/test_bpftool_synctypes.py
> @@ -374,7 +374,7 @@ class ManProgExtractor(ManPageExtractor):
>      """
>      An extractor for bpftool-prog.rst.
>      """
> -    filename = os.path.join(BPFTOOL_DIR, 'Documentation/bpftool-prog.rst')
> +    filename = os.path.join(BPFTOOL_DIR, 'tools/bpf/bpftool/Documentation/bpftool-prog.rst')
>  
>      def get_attach_types(self):
>          return self.get_rst_list('ATTACH_TYPE')
> 

No I don't believe it should. BPFTOOL_DIR already contains
'tools/bpf/bpftool' and the os.path.join() concatenates the two path
fragments.

Where is this suggestion coming from? Did you face an issue with the script?

Same comment applies for the next two patches.

Quentin
