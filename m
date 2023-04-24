Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5FDC36E4C46
	for <lists+linux-doc@lfdr.de>; Mon, 17 Apr 2023 17:01:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231194AbjDQPBn (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Mon, 17 Apr 2023 11:01:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230519AbjDQPBl (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 17 Apr 2023 11:01:41 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1DBC81BF8
        for <linux-doc@vger.kernel.org>; Mon, 17 Apr 2023 08:00:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1681743629;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=hLT0rP9zRrFGagsk4no7XW+N43K0c6wa29Y33hfsxZA=;
        b=Se17SZmqN5XuI/wYq38EuCdMWVtaJN3+9L2TLB7YdIuwtsd4NE36BAPhLsa4O0DNaBXLB3
        QQVGZ0ER3F+fqiHGOKpmiBqdIJ6XrZF/rwBTgF+kLSuYEF5Rmu0YhxgWMWZojzaN79nA/W
        nR5XGLr1p7+TpRLFDq0GT/1hFlzhQRQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-180-Z2H31h7uM2uQxW9ax0i8LA-1; Mon, 17 Apr 2023 11:00:27 -0400
X-MC-Unique: Z2H31h7uM2uQxW9ax0i8LA-1
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-3f080f534acso9282415e9.0
        for <linux-doc@vger.kernel.org>; Mon, 17 Apr 2023 08:00:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681743626; x=1684335626;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hLT0rP9zRrFGagsk4no7XW+N43K0c6wa29Y33hfsxZA=;
        b=Roux8o2+3Nv2VAg858v+YQGiBmlHfLUjQoBZ4Y1Kxwb7GLg9xJxw9FD2MY3uqka96G
         jpQGfvWezo3vrpicmp01ppR7krgCqXLdAKI7RAPbuTzILLdgDohqF5H/ItjNDkRrdsW+
         LQ8XX2hjUjOy/aFUCFKrn7HN0gNyZwTB82qXg5zRtCCqnqOvaEx3dPcvhr+TTqgpkM9P
         HoA3e4r+tZ+Uwp8+y/gERPUQWQiLkKLlAWPL8T2gx2IOhhpWKy/XI3U7cAL4/IX2e4Qv
         hpJhtLQOYwfL+PKiMRTQfMeTHzCOXWQ4pti3RKyiCGOKuZlQdPAn/z2Ht/i295I6ndrz
         gnUQ==
X-Gm-Message-State: AAQBX9d5GPHDJsJjg2p+PqBtdP6NnaIVAVWJt4Nbf1ZRFEopU9ODyqIS
        6LvZzsJYEOLDl56CYbcW9ILiM2SjMD4N4Z4afoGfEWIaJFOAMDgzPAXHqUCrr8f5sqT8KEujjVX
        LcDAFbqAYi+I16YOoaWdx
X-Received: by 2002:adf:ed4c:0:b0:2f5:3dfd:f4d2 with SMTP id u12-20020adfed4c000000b002f53dfdf4d2mr5640109wro.64.1681743626554;
        Mon, 17 Apr 2023 08:00:26 -0700 (PDT)
X-Google-Smtp-Source: AKy350YsKOxwZX6am7dDPrBSxeyriaPLE8HJ1zejtvMwWin7cKY8fooXz/gsbQvRu662UxNAvKAkdA==
X-Received: by 2002:adf:ed4c:0:b0:2f5:3dfd:f4d2 with SMTP id u12-20020adfed4c000000b002f53dfdf4d2mr5640088wro.64.1681743626208;
        Mon, 17 Apr 2023 08:00:26 -0700 (PDT)
Received: from ?IPV6:2003:cb:c700:fc00:db07:68a9:6af5:ecdf? (p200300cbc700fc00db0768a96af5ecdf.dip0.t-ipconnect.de. [2003:cb:c700:fc00:db07:68a9:6af5:ecdf])
        by smtp.gmail.com with ESMTPSA id v9-20020a5d6b09000000b002d97529b3bbsm10671612wrw.96.2023.04.17.08.00.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Apr 2023 08:00:25 -0700 (PDT)
Message-ID: <b9f1fd7f-e362-8f6c-21db-e84dd82fdd00@redhat.com>
Date:   Mon, 17 Apr 2023 17:00:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v8 1/3] mm: add new api to enable ksm per process
Content-Language: en-US
To:     Stefan Roesch <shr@devkernel.io>, kernel-team@fb.com
Cc:     linux-mm@kvack.org, riel@surriel.com, mhocko@suse.com,
        linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org,
        akpm@linux-foundation.org, hannes@cmpxchg.org, willy@infradead.org,
        Bagas Sanjaya <bagasdotme@gmail.com>
References: <20230415225913.3206647-1-shr@devkernel.io>
 <20230415225913.3206647-2-shr@devkernel.io>
From:   David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20230415225913.3206647-2-shr@devkernel.io>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

> +static void __ksm_add_vma(struct vm_area_struct *vma)
> +{
> +	unsigned long vm_flags = vma->vm_flags;
> +
> +	if (vm_flags & VM_MERGEABLE)
> +		return;
> +
> +	if (vma_ksm_compatible(vma)) {
> +		vm_flags |= VM_MERGEABLE;
> +		vm_flags_reset(vma, vm_flags);
> +	}
> +}

We can do the following simplification on top:

diff --git a/mm/ksm.c b/mm/ksm.c
index 905c8edce5cf..26e7f585d65d 100644
--- a/mm/ksm.c
+++ b/mm/ksm.c
@@ -2511,15 +2511,11 @@ static int ksm_scan_thread(void *nothing)

  static void __ksm_add_vma(struct vm_area_struct *vma)
  {
-	unsigned long vm_flags = vma->vm_flags;
-
-	if (vm_flags & VM_MERGEABLE)
+	if (vma->vm_flags & VM_MERGEABLE)
  		return;

-	if (vma_ksm_compatible(vma)) {
-		vm_flags |= VM_MERGEABLE;
-		vm_flags_reset(vma, vm_flags);
-	}
+	if (vma_ksm_compatible(vma))
+		vm_flags_set(vma, VM_MERGEABLE);
  }

  /**
-- 
2.39.2


I have some patches based on your patch set (handling/testing unmerging 
whens setting PR_SET_MEMORY_MERGE=0. Will send out once you changes are 
queued.

-- 
Thanks,

David / dhildenb

