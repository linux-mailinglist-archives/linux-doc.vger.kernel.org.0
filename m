Return-Path: <linux-doc+bounces-468-lists+linux-doc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B8F757CD0EC
	for <lists+linux-doc@lfdr.de>; Wed, 18 Oct 2023 01:41:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4BF4BB20CE9
	for <lists+linux-doc@lfdr.de>; Tue, 17 Oct 2023 23:41:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5658D2F531;
	Tue, 17 Oct 2023 23:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E7jS0k/e"
X-Original-To: linux-doc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41A5A2E3ED
	for <linux-doc@vger.kernel.org>; Tue, 17 Oct 2023 23:40:54 +0000 (UTC)
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com [IPv6:2607:f8b0:4864:20::129])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9E6AB0;
	Tue, 17 Oct 2023 16:40:51 -0700 (PDT)
Received: by mail-il1-x129.google.com with SMTP id e9e14a558f8ab-3512efed950so25609795ab.2;
        Tue, 17 Oct 2023 16:40:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697586051; x=1698190851; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ODOEUN547k5ZgvBP+6sXMvboanj4Zc6JsVPCAra6ZWI=;
        b=E7jS0k/e9/9Pd/DwT8uoh/BtvNIElNt5Fpbamdg6JFJHoUBKKkZ0oCVs9fRIipKukN
         ZqiikJ8W7Vt2dgDM9fOkZZDClY4A62aE0rtpcnJqZ4L8t0BO0zF6g4QTCtHcwPzO7UQg
         i+5nieCsv3pmdiGZnhU5jwqeMFfNp8mldMjuMyiwXY7QWl18I/S2FUTjDXAfgg5+bLcR
         d5Ux8KIWxDWg+N69TLsIrJDPT0Eo+N9XWHHGUnXSxOc6q7GhvtkTpqbQmN1VX2FDzdEc
         kRKlpg8aL57YB3LbR0DBdVWxAqipq2IKk/wBvffCDWjoAvs6yk7knVRCTbw55+12shX2
         4F8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697586051; x=1698190851;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ODOEUN547k5ZgvBP+6sXMvboanj4Zc6JsVPCAra6ZWI=;
        b=eUUlWi3ZG1meyzbhh27jxwNfpTqlerI0sqHCywzT06oGDFGKrTMsN8AvucP0jWJbTv
         MP2VhhSw1a/sxi7oxLhvC3YzIbJjwRH9Xl4bwwQevQ4TPdbtUzEcO4CiUEt/DGceJsF5
         1V3Pr/+vkSzFw1lc42qZ4o2SnEeAllsx6G60nP0BVM9D38Y4c0rw6tYYHRNqD2lPmb1C
         IGJLKhCaQFPjQmHzT8IvKnJxYdFkH1ioqooGnVsh6FIw+lwjK4aEdnH1ZfL68Q9T+kaF
         MVlvaCrnhmHFMQfTl+tqJRC68G3O1OMD/3qwnGjKHP4zHOR2j3jR1IqBa8gA7w76+Lcp
         jk2A==
X-Gm-Message-State: AOJu0Yxh7SAcYxpozGd7oAXnCWGzWRncRTK16NXncJ796uLa/zgoDCYE
	plFt0+yjoVpeuEOhc+UNor+Zz4gTEdKQRTneqZw=
X-Google-Smtp-Source: AGHT+IEBG8Fe8t+85apuz/mLY6nAFwGEVCcaLIqVclT3qY/EkJZfquZLXwIWGGz7iQNP7Jybzpm73yH4xw1qVnE4gx0=
X-Received: by 2002:a92:a306:0:b0:34f:d665:4c2e with SMTP id
 a6-20020a92a306000000b0034fd6654c2emr3727701ili.30.1697586051184; Tue, 17 Oct
 2023 16:40:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231017232152.2605440-1-nphamcs@gmail.com> <20231017232152.2605440-4-nphamcs@gmail.com>
 <CAKEwX=NgsbJ6MQJdJoOTDiGyhjhRA8KJdYe5GzV5iK1bRADfuQ@mail.gmail.com> <e9da3fb2-e44a-4c42-8f9f-cf24be12ccb7@quicinc.com>
In-Reply-To: <e9da3fb2-e44a-4c42-8f9f-cf24be12ccb7@quicinc.com>
From: Nhat Pham <nphamcs@gmail.com>
Date: Tue, 17 Oct 2023 16:40:38 -0700
Message-ID: <CAKEwX=M3WP=awVcNRDCYWpjwBPvwdyb5NFrVXPOEzvCpqNJ-NA@mail.gmail.com>
Subject: Re: [PATCH v3 3/5] mm: memcg: add per-memcg zswap writeback stat
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: akpm@linux-foundation.org, hannes@cmpxchg.org, cerasuolodomenico@gmail.com, 
	yosryahmed@google.com, sjenning@redhat.com, ddstreet@ieee.org, 
	vitaly.wool@konsulko.com, mhocko@kernel.org, roman.gushchin@linux.dev, 
	shakeelb@google.com, muchun.song@linux.dev, linux-mm@kvack.org, 
	kernel-team@meta.com, linux-kernel@vger.kernel.org, cgroups@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, shuah@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Tue, Oct 17, 2023 at 4:38=E2=80=AFPM Jeff Johnson <quic_jjohnson@quicinc=
.com> wrote:
>
> On 10/17/2023 4:35 PM, Nhat Pham wrote:
> > On Tue, Oct 17, 2023 at 4:21=E2=80=AFPM Nhat Pham <nphamcs@gmail.com> w=
rote:
> >>
> >> From: Domenico Cerasuolo <cerasuolodomenico@gmail.com>
> >>
> >> Since zswap now writes back pages from memcg-specific LRUs, we now nee=
d a
> >> new stat to show writebacks count for each memcg.
> >>
> >> Suggested-by: Nhat Pham <nphamcs@gmail.com>
> >> Signed-off-by: Domenico Cerasuolo <cerasuolodomenico@gmail.com>
> >> Signed-off-by: Nhat Pham <nphamcs@gmail.com>
> >
> > /s/Signed-off/Acked
> > This is Domenico's work :) I used the wrong tag here. Should be:
> > Acked-by: Nhat Pham <nphamcs@gmail.com>
>
> no, since you are posting the patch, you have to sign off on it.
> Signed-off-by is correct
>

Ah so past Nhat was right all along. Ignore my comments then.
Thanks for letting me know, Jeff!

