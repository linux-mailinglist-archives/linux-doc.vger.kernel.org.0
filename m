Return-Path: <linux-doc-owner@vger.kernel.org>
X-Original-To: lists+linux-doc@lfdr.de
Delivered-To: lists+linux-doc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0A5C967F8C2
	for <lists+linux-doc@lfdr.de>; Sat, 28 Jan 2023 15:38:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234619AbjA1Oip (ORCPT <rfc822;lists+linux-doc@lfdr.de>);
        Sat, 28 Jan 2023 09:38:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234405AbjA1Oim (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 28 Jan 2023 09:38:42 -0500
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1D9B206A6;
        Sat, 28 Jan 2023 06:38:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674916720; x=1706452720;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=TIWAIiE/Um0/DDy4ue9IDiDz57FjmJ1SOy/S5NjSc+k=;
  b=ODGHJ8mvM3XdyYoe49pIV/SI4nASaLwPgD52VSeaf/NJy9h5YLEuRJ6P
   CIE7ux6KDmctesQRMCfX1+uCwElfiOokFpg4hI/1K/Dh4hlMn5Z5jOSWm
   GGVPOIsA+XuOhRrB60ks4wSreO2tlhtyQ597EKlviJtXHR8ln+C55P/+i
   QBKk8xfqnvju3vke7CYI2Juam+OJ5qtaciMU1FdMq6yoHZbiC9c6jkNIC
   f1pz5KjJqaQJ9vtcSrASVRGEk+DHK/87m4FyJwfxbiyzhjPX+jjR/n4G4
   57o4Zc21jC+nmP5FxvOpGLTkxVqhmddJG9ETVcvvDCdpPd5rYulmRfiFL
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10604"; a="306944590"
X-IronPort-AV: E=Sophos;i="5.97,254,1669104000"; 
   d="scan'208";a="306944590"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2023 06:38:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10604"; a="908984119"
X-IronPort-AV: E=Sophos;i="5.97,254,1669104000"; 
   d="scan'208";a="908984119"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 28 Jan 2023 06:38:35 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1pLmLi-0000nh-2j;
        Sat, 28 Jan 2023 14:38:34 +0000
Date:   Sat, 28 Jan 2023 22:38:19 +0800
From:   kernel test robot <lkp@intel.com>
To:     Janis Schoetterl-Glausch <scgl@linux.ibm.com>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Janosch Frank <frankja@linux.ibm.com>,
        Claudio Imbrenda <imbrenda@linux.ibm.com>,
        Heiko Carstens <hca@linux.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Alexander Gordeev <agordeev@linux.ibm.com>
Cc:     llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
        Janis Schoetterl-Glausch <scgl@linux.ibm.com>,
        David Hildenbrand <david@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>, kvm@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-kselftest@vger.kernel.org, linux-s390@vger.kernel.org,
        Paolo Bonzini <pbonzini@redhat.com>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Sven Schnelle <svens@linux.ibm.com>
Subject: Re: [PATCH v6 12/14] KVM: s390: Extend MEM_OP ioctl by storage key
 checked cmpxchg
Message-ID: <202301282258.RvVJOYVA-lkp@intel.com>
References: <20230125212608.1860251-13-scgl@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230125212608.1860251-13-scgl@linux.ibm.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Janis,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on kvm/queue]
[also build test ERROR on lwn/docs-next linus/master v6.2-rc5 next-20230127]
[cannot apply to kvms390/next kvm/linux-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Janis-Schoetterl-Glausch/KVM-s390-selftest-memop-Pass-mop_desc-via-pointer/20230128-132603
base:   https://git.kernel.org/pub/scm/virt/kvm/kvm.git queue
patch link:    https://lore.kernel.org/r/20230125212608.1860251-13-scgl%40linux.ibm.com
patch subject: [PATCH v6 12/14] KVM: s390: Extend MEM_OP ioctl by storage key checked cmpxchg
config: s390-randconfig-r022-20230123 (https://download.01.org/0day-ci/archive/20230128/202301282258.RvVJOYVA-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 4196ca3278f78c6e19246e54ab0ecb364e37d66a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/6e6b3d99b9978a70b148b989d46b039feda3a3c3
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Janis-Schoetterl-Glausch/KVM-s390-selftest-memop-Pass-mop_desc-via-pointer/20230128-132603
        git checkout 6e6b3d99b9978a70b148b989d46b039feda3a3c3
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=s390 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash arch/s390/kvm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from arch/s390/kvm/gaccess.c:16:
   In file included from arch/s390/kvm/kvm-s390.h:17:
   In file included from include/linux/kvm_host.h:19:
   In file included from include/linux/msi.h:27:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __raw_readb(PCI_IOBASE + addr);
                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:37:59: note: expanded from macro '__le16_to_cpu'
   #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
                                                             ^
   include/uapi/linux/swab.h:102:54: note: expanded from macro '__swab16'
   #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
                                                        ^
   In file included from arch/s390/kvm/gaccess.c:16:
   In file included from arch/s390/kvm/kvm-s390.h:17:
   In file included from include/linux/kvm_host.h:19:
   In file included from include/linux/msi.h:27:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
                                                             ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
   #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
                                                        ^
   In file included from arch/s390/kvm/gaccess.c:16:
   In file included from arch/s390/kvm/kvm-s390.h:17:
   In file included from include/linux/kvm_host.h:19:
   In file included from include/linux/msi.h:27:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:692:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsb(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:700:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsw(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:708:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsl(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:717:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesb(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   include/asm-generic/io.h:726:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesw(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   include/asm-generic/io.h:735:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesl(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
>> arch/s390/kvm/gaccess.c:1217:9: error: call to undeclared function 'cmpxchg_user_key'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                   ret = cmpxchg_user_key((u8 *)hva, &old, *old_addr, new, access_key);
                         ^
   arch/s390/kvm/gaccess.c:1217:9: note: did you mean 'copy_to_user_key'?
   arch/s390/include/asm/uaccess.h:51:1: note: 'copy_to_user_key' declared here
   copy_to_user_key(void __user *to, const void *from, unsigned long n, unsigned long key)
   ^
   arch/s390/kvm/gaccess.c:1225:9: error: call to undeclared function 'cmpxchg_user_key'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                   ret = cmpxchg_user_key((u16 *)hva, &old, *old_addr, new, access_key);
                         ^
   arch/s390/kvm/gaccess.c:1233:9: error: call to undeclared function 'cmpxchg_user_key'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                   ret = cmpxchg_user_key((u32 *)hva, &old, *old_addr, new, access_key);
                         ^
   arch/s390/kvm/gaccess.c:1241:9: error: call to undeclared function 'cmpxchg_user_key'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                   ret = cmpxchg_user_key((u64 *)hva, &old, *old_addr, new, access_key);
                         ^
   arch/s390/kvm/gaccess.c:1249:9: error: call to undeclared function 'cmpxchg_user_key'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                   ret = cmpxchg_user_key((__uint128_t *)hva, &old, *old_addr, new, access_key);
                         ^
   12 warnings and 5 errors generated.


vim +/cmpxchg_user_key +1217 arch/s390/kvm/gaccess.c

  1163	
  1164	/**
  1165	 * cmpxchg_guest_abs_with_key() - Perform cmpxchg on guest absolute address.
  1166	 * @kvm: Virtual machine instance.
  1167	 * @gpa: Absolute guest address of the location to be changed.
  1168	 * @len: Operand length of the cmpxchg, required: 1 <= len <= 16. Providing a
  1169	 *       non power of two will result in failure.
  1170	 * @old_addr: Pointer to old value. If the location at @gpa contains this value,
  1171	 *            the exchange will succeed. After calling cmpxchg_guest_abs_with_key()
  1172	 *            *@old_addr contains the value at @gpa before the attempt to
  1173	 *            exchange the value.
  1174	 * @new: The value to place at @gpa.
  1175	 * @access_key: The access key to use for the guest access.
  1176	 * @success: output value indicating if an exchange occurred.
  1177	 *
  1178	 * Atomically exchange the value at @gpa by @new, if it contains *@old.
  1179	 * Honors storage keys.
  1180	 *
  1181	 * Return: * 0: successful exchange
  1182	 *         * a program interruption code indicating the reason cmpxchg could
  1183	 *           not be attempted
  1184	 *         * -EINVAL: address misaligned or len not power of two
  1185	 *         * -EAGAIN: transient failure (len 1 or 2)
  1186	 *         * -EOPNOTSUPP: read-only memslot (should never occur)
  1187	 */
  1188	int cmpxchg_guest_abs_with_key(struct kvm *kvm, gpa_t gpa, int len,
  1189				       __uint128_t *old_addr, __uint128_t new,
  1190				       u8 access_key, bool *success)
  1191	{
  1192		gfn_t gfn = gpa >> PAGE_SHIFT;
  1193		struct kvm_memory_slot *slot = gfn_to_memslot(kvm, gfn);
  1194		bool writable;
  1195		hva_t hva;
  1196		int ret;
  1197	
  1198		if (!IS_ALIGNED(gpa, len))
  1199			return -EINVAL;
  1200	
  1201		hva = gfn_to_hva_memslot_prot(slot, gfn, &writable);
  1202		if (kvm_is_error_hva(hva))
  1203			return PGM_ADDRESSING;
  1204		/*
  1205		 * Check if it's a read-only memslot, even though that cannot occur
  1206		 * since those are unsupported.
  1207		 * Don't try to actually handle that case.
  1208		 */
  1209		if (!writable)
  1210			return -EOPNOTSUPP;
  1211	
  1212		hva += offset_in_page(gpa);
  1213		switch (len) {
  1214		case 1: {
  1215			u8 old;
  1216	
> 1217			ret = cmpxchg_user_key((u8 *)hva, &old, *old_addr, new, access_key);
  1218			*success = !ret && old == *old_addr;
  1219			*old_addr = old;
  1220			break;
  1221		}
  1222		case 2: {
  1223			u16 old;
  1224	
  1225			ret = cmpxchg_user_key((u16 *)hva, &old, *old_addr, new, access_key);
  1226			*success = !ret && old == *old_addr;
  1227			*old_addr = old;
  1228			break;
  1229		}
  1230		case 4: {
  1231			u32 old;
  1232	
  1233			ret = cmpxchg_user_key((u32 *)hva, &old, *old_addr, new, access_key);
  1234			*success = !ret && old == *old_addr;
  1235			*old_addr = old;
  1236			break;
  1237		}
  1238		case 8: {
  1239			u64 old;
  1240	
  1241			ret = cmpxchg_user_key((u64 *)hva, &old, *old_addr, new, access_key);
  1242			*success = !ret && old == *old_addr;
  1243			*old_addr = old;
  1244			break;
  1245		}
  1246		case 16: {
  1247			__uint128_t old;
  1248	
  1249			ret = cmpxchg_user_key((__uint128_t *)hva, &old, *old_addr, new, access_key);
  1250			*success = !ret && old == *old_addr;
  1251			*old_addr = old;
  1252			break;
  1253		}
  1254		default:
  1255			return -EINVAL;
  1256		}
  1257		mark_page_dirty_in_slot(kvm, slot, gfn);
  1258		/*
  1259		 * Assume that the fault is caused by protection, either key protection
  1260		 * or user page write protection.
  1261		 */
  1262		if (ret == -EFAULT)
  1263			ret = PGM_PROTECTION;
  1264		return ret;
  1265	}
  1266	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
